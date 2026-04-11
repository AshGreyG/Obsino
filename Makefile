# ---- Configuration ----
# Set this to the base name of input cue files
FILE ?= <file>
TARGET ?= <target>
DIR ?= <directory>

PACKAGE := $(shell cat cue.mod/module.cue | yq -r ".module")
HANDBOOK_POSTFIX := $(notdir $(patsubst %/,%,$(CURDIR)))
RAW_CLASS := $(basename $(notdir $(FILE)))
CLASS := $(subst -,_,$(RAW_CLASS))

TEMP := temp.typ
IGNORE_DIRS := cue.mod assets asset bin
SHELL := /bin/bash

.PHONY: single-export package-export handbook clean help

# This subcommand exports the single cue file that need to be exported through
# CUE package system
package-export:
	@echo "→ Starting to process package $(PACKAGE)/$(DIR) and single property $(TARGET) in it"
	@cue export $(PACKAGE)/$(DIR) --out yaml | yq -r ".$(TARGET).content" > $(TEMP)
	@echo "→ Formatting generated raw typst file content"
	@typstyle -i $(TEMP)
	@echo "→ Temp typst file content:"
	@cat $(TEMP)
	@typst compile $(TEMP) $(TARGET).pdf
	@rm -f $(TEMP)
	@echo "✅ successfully generate the pdf of content"

## This subcommand exports the normal single cue file
single-export:
	@echo "→ Starting to process single CUE file $(FILE)"
	@cue export $(FILE) --out yaml | yq -r ".$(CLASS).content" > $(TEMP)

	@typst compile $(TEMP) $(RAW_CLASS).pdf
	@rm -f $(TEMP)
	@echo "✅ successfully generate the pdf of content"

# This subcommand exports all the content into a handbook
handbook:
	@echo "→ Starting to export all the content into handbook-$(HANDBOOK_POSTFIX).pdf"; \
	\
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
	echo "#align(center)[= Handbook of $$(title_func $(HANDBOOK_POSTFIX))]" >> $(TEMP); \
	\
	# 1. Get all directories, filtering out ignored ones \
	i=0; \
  t="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; \
	for dir in $$(ls -d */ | cut -f1 -d"/"); do \
		if echo "$(IGNORE_DIRS)" | grep -qw "$$dir"; then continue; fi; \
		\
		echo "→ Entering directory: $$dir/"; \
		echo "#align(center)[= $${t:$$i:1} $$(title_func $$dir)]" >> $(TEMP); \
		\
		# 2. Iterate through CUE files in that directory \
		for file in $$dir/*.cue; do \
			echo "→   Exporting file $$file"; \
			echo "== $$(title_func $$(basename $$file | sed -E "s/.cue//g"))" >> $(TEMP); \
			cue export $(PACKAGE)/$$dir --out yaml | yq -r ".$$(basename $$file | sed -e "s/.cue//g" -e "s/-/_/g").content" >> $(TEMP); \
		done; \
		i=$$((i + 1)); \
	done; \
	\
	typstyle -i $(TEMP); \
	typst compile $(TEMP) handbook-$(HANDBOOK_POSTFIX).pdf; \
	rm -rf $(TEMP); \
	echo "✅ successfully generate the pdf of content"

clean:
	@if ls *.pdf >/dev/null 2>&1; then \
		rm -f *.pdf; \
		echo "✅ clean successfully"; \
	else \
		echo "❌ failed to clean because there are no matched files"; \
	fi

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