#!/usr/bin/env bash

# process-content.sh — Transform raw Typst content by resolving external
# resources (remote images, SMILES molecular structures, figures:// labels)
# into locally-downloaded assets.
#
# Usage: process-content.sh [options] < raw_content.txt > transformed.txt
#
# Options:
#   --downloads DIR     Download directory (default: download)
#   --cache DIR         Cache directory for downloaded files
#                       (default: <root>/.cache/figures)
#   --pictures FILE     Path to pictures.yaml (default: <root>/pictures.yaml)
#   --smiles-dir DIR    Smiles rendering pipeline directory
#                       (default: <root>/.pipeline/smiles)
#
# Reads raw Typst content from stdin, processes these schemas in order:
#   1. `https://` URLs     ->  downloaded files (via curl, cached)
#   2. `smiles://` strings ->  rendered SVG files (via smiles.mjs)
#   3. `figures://` labels ->  downloaded files (via curl, cached,
#                              looked up in pictures.yaml)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

REMOTE_DOWNLOADS="download"
CACHE_DIR="$ROOT/.cache/figures"
PICTURES="$ROOT/pictures.yaml"
SMILES_DIR="$ROOT/.pipeline/smiles"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --downloads) REMOTE_DOWNLOADS="$2"; shift 2 ;;
    --cache)     CACHE_DIR="$2";         shift 2 ;;
    --pictures)  PICTURES="$2";          shift 2 ;;
    --smiles-dir) SMILES_DIR="$2";       shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

mkdir -p "$REMOTE_DOWNLOADS"
mkdir -p "$CACHE_DIR"

raw_content=$(cat)

get_extension() {
  local url="$1"
  local base="${url%%\?*}"
  local extension="${base##*.}"
  if [ "$extension" == "$base" ]; then
    echo ""
  else
    echo "$extension" | tr '[:upper:]' '[:lower:]'
  fi
}

# Download a URL to the cache if not already present, then copy to downloads.
cache_download() {
  local url="$1"
  local filename
  filename="$(echo -n "$url" | md5sum | awk '{print $1}').$(get_extension "$url")"

  if [ -f "$CACHE_DIR/$filename" ] && [ -s "$CACHE_DIR/$filename" ]; then
    cp -- "$CACHE_DIR/$filename" "$REMOTE_DOWNLOADS/$filename"
    echo "> Using cached $filename" >&2
    return 0
  fi

  echo "> Downloading $filename" >&2
  curl -s -L "$url" -o "$CACHE_DIR/$filename" || true
  if [ -f "$CACHE_DIR/$filename" ] && [ -s "$CACHE_DIR/$filename" ]; then
    cp -- "$CACHE_DIR/$filename" "$REMOTE_DOWNLOADS/$filename"
    echo "> Downloaded and cached $filename" >&2
    return 0
  fi

  rm -f "$CACHE_DIR/$filename"
  echo "! Warning: Failed to download $url" >&2
  return 1
}

# Process https:// URLs (direct remote image links)
img_urls=$(echo "$raw_content" \
  | grep -o 'image("https://[^"]*' \
  | sed 's/image("//') || true

if [ -n "$img_urls" ]; then
  while IFS= read -r url; do
    if [ -n "$url" ]; then
      if cache_download "$url"; then
        img_name="$(echo -n "$url" | md5sum | awk '{print $1}').$(get_extension "$url")"
        raw_content=$(echo "$raw_content" | sed "s|$url|$REMOTE_DOWNLOADS/$img_name|g")
      fi
    fi
  done <<< "$img_urls"
fi

# Process smiles:// strings (molecular structure rendering)
smiles_list=$(echo "$raw_content" \
  | grep -o 'image("smiles://[^"]*' \
  | sed 's/image("smiles:\/\///') || true

if [ -n "$smiles_list" ]; then
  while IFS= read -r smile; do
    if [ -n "$smile" ]; then
      echo "> Rendering SMILES: $smile" >&2
      pushd "$SMILES_DIR" > /dev/null
      ./smiles.mjs "$smile" >&2 || true
      structure=(structure*.svg)
      if [[ -f "${structure[0]}" ]]; then
        mv -- "${structure[0]}" "/tmp/${structure[0]}"
      fi
      popd > /dev/null
      if [ -f "/tmp/${structure[0]}" ]; then
        mv -- "/tmp/${structure[0]}" "$REMOTE_DOWNLOADS/${structure[0]}"
        echo "> Rendered $smile -> ${structure[0]}" >&2
        esc=$(echo "$smile" | sed -e 's/\\/\\\\/g' -e 's/[]]/\\]/g' -e 's/\[/\\[/g' -e 's/\./\\./g' -e 's/\//\\\//g')
        raw_content=$(echo "$raw_content" \
          | sed "s|image(\"smiles://$esc\")|image(\"$REMOTE_DOWNLOADS/${structure[0]}\")|g")
      else
        echo "! Warning: Failed to render SMILES: $smile" >&2
      fi
    fi
  done <<< "$smiles_list"
fi

# Process figures:// labels (looked up in pictures.yaml)
figures=$(echo "$raw_content" \
  | grep -o 'image("figures://[^"]*' \
  | sed 's/image("figures:\/\///') || true

if [ -n "$figures" ]; then
  while IFS= read -r label; do
    if [ -n "$label" ]; then
      if [ ! -f "$PICTURES" ]; then
        echo "! Warning: pictures.yaml not found at $PICTURES" >&2
        continue
      fi
      urls=$(yq -r ".pictures[\"${label}\"][]" "$PICTURES" 2>/dev/null)
      if [ -n "$urls" ]; then
        fig_downloaded=false
        while IFS= read -r fig_url; do
          if [ -n "$fig_url" ]; then
            fig_name="$(echo -n "$fig_url" | md5sum | awk '{print $1}').$(get_extension "$fig_url")"
            if cache_download "$fig_url"; then
              raw_content=$(echo "$raw_content" \
                | sed "s|figures://$label|$REMOTE_DOWNLOADS/$fig_name|g")
              fig_downloaded=true
              break
            fi
          fi
        done <<< "$urls"
        if [ "$fig_downloaded" = false ]; then
          echo "! Warning: Failed to download any URL for figure label: $label" >&2
        fi
      else
        echo "! Warning: No URLs found for figure label: $label in pictures.yaml" >&2
      fi
    fi
  done <<< "$figures"
fi

echo "$raw_content"
