# Copyright 2026 AshGrey
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in the
# Software without restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so, subject to the
# following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# This is the header of every handbook, you can add predefined functions or
# styles here.

# ---- Configuration ----
# Set this to the base name of input cue files
FILE ?= <file>
TARGET ?= <target>
DIR ?= <directory>

# Root directory
ROOT := $(shell dirname $(shell readlink Makefile))
# Extract package name from cue.mod/module.cue file
PACKAGE := $(shell cat cue.mod/module.cue | yq -r ".module")
# Extract directory name for handbook postfix (used in handbook filename)
HANDBOOK_POSTFIX := $(notdir $(patsubst %/,%,$(CURDIR)))
# Get raw class name from FILE (without extension)
RAW_CLASS := $(basename $(notdir $(FILE)))
# Convert class name from hyphen-case to underscore-case for CUE property access
CLASS := $(subst -,_,$(RAW_CLASS))

# Temporary file for typst content generation
TEMP := temp.typ
# Header Typst file for typst functions / style configurations
HEADER := header.typ
RESOURCE := resource.yaml
PICTURES := $(ROOT)/pictures.yaml
REMOTE_DOWNLOADS := download
# Directories to ignore when generating handbook
IGNORE_DIRS := cue.mod assets asset bin src
# Set shell to bash for compatibility
SHELL := /bin/bash

.PHONY: single-export package-export handbook clean help

# This subcommand exports a single cue file through the CUE package system
# It extracts a specific property (TARGET) from a package and generates PDF
package-export:
	@echo "→ Starting to process package $(PACKAGE)/$(DIR) and single property $(TARGET) in it"
	@echo "  Exporting CUE package to YAML and extracting $(TARGET).content"
	@cat $(HEADER) > $(TEMP)
	@raw_content=$$(cue export $(PACKAGE)/$(DIR) --out yaml | yq -r ".$(TARGET).content"); \
	raw_content=$$(echo "$$raw_content" | $(ROOT)/.pipeline/process-content.sh --downloads $(REMOTE_DOWNLOADS)); \
	echo "$$raw_content" >> $(TEMP)
	@echo "→ Formatting generated raw typst file content"
	@typstyle -i $(TEMP)
	@echo "→ Temp typst file content:"
	@cat $(TEMP)
	@echo "  Compiling typst file to $(TARGET).pdf"
	@typst compile $(TEMP) $(TARGET).pdf
	@rm -f $(TEMP)
	@rm -rf $(REMOTE_DOWNLOADS)
	@echo "✅ successfully generate the pdf of content"

# This subcommand exports a single CUE file directly
# It processes a single file and generates PDF from its content property
single-export:
	@echo "→ Starting to process single CUE file $(FILE)"
	@echo "  Exporting CUE file to YAML and extracting $(CLASS).content"
	@cat $(HEADER) > $(TEMP)
	@cue export $(FILE) --out yaml | yq -r ".$(CLASS).content" >> $(TEMP)
	@echo "→ Formatting generated raw typst file content"
	@typstyle -i $(TEMP)
	@echo "→ Temp typst file content:"
	@cat $(TEMP)
	@echo "  Compiling typst file to $(RAW_CLASS).pdf"
	@typst compile $(TEMP) $(RAW_CLASS).pdf
	@rm -f $(TEMP)
	@echo "✅ successfully generate the pdf of content"

# This subcommand exports all content into a comprehensive handbook PDF
handbook:
	@echo "→ Starting to export all the content into handbook-$(HANDBOOK_POSTFIX).pdf"; \
	\
	# Function to convert hyphen-case to Title Case for headings; \
	title_func() { \
		local str="$$1"; \
		str=$${str//-/ }; \
		local -a words=($$str); \
		local processed=""; \
		for w in "$${words[@]}"; do \
			processed+=" $${w^}"; \
		done; \
		echo "$$processed"; \
	}; \
	\
	# Write handbook title to temp file; \
	cat $(HEADER) > $(TEMP); \
	echo "" >> $(TEMP); \
	echo "#align(center)[= Handbook of $$(title_func $(HANDBOOK_POSTFIX))]" >> $(TEMP); \
	echo "#outline()" >> $(TEMP); \
	echo "#pagebreak()" >> $(TEMP); \
	\
	# 1. Get all directories, filtering out ignored ones; \
	i=0; \
	t="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; \
	for dir in $$(ls -d */ | cut -f1 -d"/"); do \
		if echo "$(IGNORE_DIRS)" | grep -qw "$$dir"; then continue; fi; \
		echo "→ Entering directory: $$dir/"; \
		\
		# Write section header for each directory; \
		echo "#align(center)[= $${t:$$i:1} $$(title_func $$dir)]" >> $(TEMP); \
		\
		# 2. Iterate through CUE files in directory order (from resource.yaml) or alphabetically; \
		target_files=(); \
		if [[ -f "$(RESOURCE)" ]]; then \
			order_type=$$(yq -r ".order.$$dir | type" "$(RESOURCE)" 2>/dev/null); \
			if [[ "$$order_type" == "array" ]]; then \
				echo "→ Using ordering from resource.yaml for $$dir"; \
				while IFS= read -r entry; do \
					if [[ -n "$$entry" ]]; then \
						cue_file="$$dir/$$entry.cue"; \
						if [[ -f "$$cue_file" ]]; then \
							target_files+=("$$cue_file"); \
						else \
							echo "! Warning: CUE file not found: $$cue_file (from resource.yaml order)"; \
						fi; \
					fi; \
				done < <(yq -r ".order.$$dir[] // \"\"" "$(RESOURCE)" 2>/dev/null); \
			fi; \
		fi; \
		if [[ $${#target_files[@]} -eq 0 ]]; then \
			echo "→ Using alphabetical order for $$dir"; \
			mapfile -t target_files < <(ls "$$dir"/*.cue 2>/dev/null); \
		fi; \
		for file in "$${target_files[@]}"; do \
			echo "→   Exporting file $$file"; \
			\
			# Write file title; \
			echo "== $$(title_func $$(basename $$file | sed -e "s/.cue//g"))" >> $(TEMP); \
			\
			# Write file reference link; \
			reference="<$$(echo $$file | sed -e 's/\//-/g' -e 's/.cue//g')>"; \
			echo $$reference >> $(TEMP); \
			\
			# Export file content and extract content property; \
			raw_content=$$(cue export $(PACKAGE)/$$dir --out yaml | yq -r ".$$(basename $$file | sed -e 's/.cue//g' -e 's/-/_/g').content"); \
			raw_content=$$(echo "$$raw_content" | $(ROOT)/.pipeline/process-content.sh --downloads $(REMOTE_DOWNLOADS)); \
			echo "$$raw_content" >> $(TEMP); \
			\
			related=$$(cue export $(PACKAGE)/$$dir --out json | yq -r ".$$(basename $$file | sed -e 's/.cue//g' -e 's/-/_/g').related"); \
			if [[ ! $$related =~ "null" ]]; then \
				echo -e "\nRelated Knowledge: " >> $(TEMP); \
				tmp=$${related#[}; \
				tmp=$${tmp%]}; \
				for label in $$(echo "$$tmp" | tr "," " "); do \
					link="- #link(<$$(echo $$label | sed -e 's/\//-/g' -e 's/\"//g')>)[#text(blue)[$$(echo $$label | sed -e 's/\"//g')]]"; \
					echo $$link >> $(TEMP); \
				done; \
			fi; \
		done; \
		i=$$((i + 1)); \
	done; \
	\
	# Format and compile the handbook
	@echo "→ Formatting handbook with typstyle"
	@typstyle -i $(TEMP)
	@echo "→ Compiling handbook to PDF"
	@typst compile $(TEMP) handbook-$(HANDBOOK_POSTFIX).pdf
	@echo "→ Cleaning up temporary files"
	@rm -f $(TEMP)
	@rm -rf $(REMOTE_DOWNLOADS)
	@echo "✅ successfully generate the pdf of content"

# Clean up generated PDF files
clean:
	@echo "→ Cleaning up generated PDF files"
	@if ls *.pdf >/dev/null 2>&1 || ls temp.typ >/dev/null 2>&1; then \
		rm -f *.pdf temp.typ; \
		echo "✅ clean successfully"; \
	else \
		echo "❌ failed to clean because there are no matched files"; \
	fi

# Display help information for available subcommands
help:
	@echo    "Available subcommands: "
	@echo -e " \033[32m single-export FILE=<single-file-name> \033[0m"
	@echo    ""
	@echo    "  → single-export will export content property of single CUE file"
	@echo    "    into a temp typst-compiled PDF file. For example:"
	@echo    "    \"make single-export FILE=phenomenon/input-growth.cue\""
	@echo    ""
	@echo -e " \033[32m package-export PACKAGE=<package-name> TARGET=<target-single-file> \033[0m"
	@echo    ""
	@echo    "  → Because CUE only supports embedding files in module, so we must"
	@echo    "    export package name to export those CUE files using extern(embed)"
	@echo    "    feature. And when we don't want to export whole package, we can"
	@echo    "    use TARGET flag to export our target single file. Notice TARGET"
	@echo    "    is not the file name but the property name in this package."
	@echo    "    \"make package-export PACKAGE=formal-science.cs.algorithm/principle TARGET=maximum_subarray_problem_solution\""