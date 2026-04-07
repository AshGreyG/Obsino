# ---- Configuration ----
# Set this to the base name of input cue files
FILE ?= <file>
PACKAGE ?= <package>
TARGET ?= <target>
RAW_CLASS := $(basename $(notdir $(FILE)))
CLASS := $(subst -,_,$(RAW_CLASS))

TEMP = temp.typ

.PHONY = single-export package-export clean help

package-export:
	@echo "→ Starting to process package $(PACKAGE) and single property $(TARGET) in it"
	@cue export $(PACKAGE) --out yaml | yq -r ".$(TARGET).content" > $(TEMP)
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

	@# sed processes these cases:
	@# 1. After yq processing the cue export, there are "s at the beginning and
	@#    the end of the content;
	@# 2. "" in math equation will be escaped as \" so typst cannot deal with
	@#    them correctly.

	@typst compile $(TEMP) $(RAW_CLASS).pdf
	@rm -f $(TEMP)
	@echo "✅ successfully generate the pdf of content"

clean:
	@rm -f *.pdf *.typ && echo "✅ clean successfully" || echo "❌ failed to clean because there are no matched files"

help:
	@echo "Available subcommands: "
	@echo "  single-export FILE=<single-file-name>"
	@echo ""
	@echo "  → single-export will export content property of single CUE file"
	@echo "    into a temp typst-compiled PDF file. For example:"
	@echo "    \"make single-export FILE=phenomenon/input-growth.cue\""
	@echo ""
	@echo "  package-export PACKAGE=<package-name> TARGET=<target-single-file>"
	@echo ""
	@echo "  → Because CUE only supports embedding files in module, so we must"
	@echo "    export package name to export those CUE files using extern(embed)"
	@echo "    feature. And when we don't want to export whole package, we can"
	@echo "    use TARGET flag to export our target single file. Notice TARGET"
	@echo "    is not the file name but the property name in this package."
	@echo "    \"make package-export PACKAGE=formal-science.cs.algorithm/principle TARGET=maximum_subarray_problem_solution\""