{
  description = "🔮 Digital knowledge tree of AshGrey";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      # Define the systems you want to support
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      
      # A helper function to generate the shell for each system
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems ({ pkgs }: {
        handbook = pkgs.writeShellApplication {
          name = "handbook";
          runtimeInputs = [ pkgs.cue pkgs.yq-go pkgs.typst pkgs.typstyle pkgs.source-han-serif ];
          text = ''
            # Tell Typst where Nix installed the fonts
            export TYPST_FONT_PATHS="${pkgs.source-han-serif}"

            # Define workspace root (relative to where flake is)
            WORKSPACE_ROOT=$(pwd)
            BUILD_DIR="$WORKSPACE_ROOT/build"

            # Debug for fonts list

            ${pkgs.typst}/bin/typst fonts

            # Create build directory if it doesn't exist
            mkdir -p "$BUILD_DIR"

	          echo "→ Searching for Makefile symlink directory ..."

            # Find directories containing a Makefile that is symlink (-L follows
            # but we want to check the link itself). We use -type l to find
            # files that are symlinks
            find . -name "Makefile" -type l | while read -r makefile_path; do
              dir=$(dirname "$makefile_path")
              echo "  → Found symlink Makefile in: $dir"

              # Move into the directory
              pushd "$dir" > /dev/null

              echo "    → Running 'make clean' ..."
              make clean > /dev/null
              echo "    → Running 'make handbook' ..."
              if make handbook ; then
                # Assuming the compiled book is a PDF, we copy any pdf found in
                # that directory to our external build folder.
                find . -maxdepth 1 -name "*.pdf" -exec cp {} "$BUILD_DIR/" \;
                echo "    → Compiled book copied to build/"
              else
                echo "    x Make failed in $dir"
              fi

              popd > /dev/null
            done
          '';
        };
        clean = pkgs.writeShellApplication {
          name = "clean";
          text = ''
	          echo "→ Cleaning up build directory"
            if ls build/ >/dev/null 2>&1; then
              rm -rf build
              echo "✅ clean successfully"
            else
              echo "❌ failed to clean because there are no matched files"
            fi
          '';
        };
        status = pkgs.writeShellApplication {
          name = "status";
          text = ''
            echo "├── Human Knowledge Tree (HKT)"
            echo "│"

            # Define workspace root (relative to where flake is)
            NAME_CUE_MODULE="cue.mod"
            NAME_TYPST_HEADER="header.typ"
            IGNORE=(
              ".git"
              ".github"
              ".vscode"
              ".claude"
              ".venv"
              "node_modules"
              ".venv"
              "__pycache__"
              "build"
            )

            # Find directories containing a Makefile that is symlink (-L follows
            # but we want to check the link itself). We use -type l to find
            # files are symlinks
            walk_hkt() {
              local dir="$1"
              local prefix="$2"

              # Find immediate subdirectories that contain a Makefile (symlink) 
              # OR contain subdirectories that eventually have a Makefile

              local find_excluded=()
              for d in "''${IGNORE[@]}"; do
                find_excluded+=("-not" "-name" "$d")
              done

              # Fix SC2207: use mapfile instead of array=( $(...) )
              local raw_subdirs
              mapfile -t raw_subdirs < <(find "$dir" -maxdepth 1 -mindepth 1 -type d "''${find_excluded[@]}" | sort)

              local filtered_subdirs=()
              for s in "''${raw_subdirs[@]}"; do
                if find "''${s}" -name "Makefile" -type l | grep -q .; then
                  filtered_subdirs+=("''${s}")
                fi
              done

              local count=''${#filtered_subdirs[@]}

              for i in "''${!filtered_subdirs[@]}"; do
                local path="''${filtered_subdirs[$i]}"
                # Fix SC2155: Declare then assign

                local folder_name
                folder_name=$(basename "''${path}")

                # Determine if this is the last item in the current folder
                local is_last=$(( i == count - 1))
                local connector="├──"
                local next_prefix="''${prefix}│    "

                if (( is_last )); then
                  connector="└──"
                  next_prefix="''${prefix}    "
                fi

                # Check if this specific directory has the target Makefile symlink
                if [[ -L "$path/Makefile" ]]; then
                  local h="\033[31m[ ]"
                  local c="\033[31m[ ]"
                  [[ -f "$path/$NAME_TYPST_HEADER" ]] && h="\033[32m[x]"
                  [[ -d "$path/$NAME_CUE_MODULE" ]] && c="\033[32m[x]"

                  local status_connector=""
                  if (( is_last )); then
                    status_connector=" "
                  else
                    status_connector="│"
                  fi

                  echo -e "''${prefix}''${connector} ''${folder_name}"
                  echo -e "''${prefix}''${status_connector}"
                  echo -e "''${prefix}''${status_connector}  ''${h} Typst Header\033[0m"
                  echo -e "''${prefix}''${status_connector}  ''${c} CUE module\033[0m"
                  echo -e "''${prefix}''${status_connector}"
                elif find "$path" -name "Makefile" -type l | grep -q .; then
                  # Just a structural directory like "natural-science"
                  echo "''${prefix}''${connector} ''${folder_name}"

                  # Recurse into subdirectories
                  walk_hkt "$path" "$next_prefix"
                fi
              done
            }
            walk_hkt "." ""
          '';
        };
      });

      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            cue
            yq-go
            typst
            typstyle
          ];

          shellHook = ''
            echo "→ Environment has been set up"
            cue version
            yq --version
            typst --version
            typstyle --version
          '';
        };
      });
    };
}