DOT_FILES := $(wildcard *.dot)
SVG_FILES := $(patsubst %.dot,%.dot.svg,$(DOT_FILES))
PDF_FILE := julia_pe_slides.pdf

.PHONY: all clean svg

all: $(PDF_FILE)

svg: $(SVG_FILES)

%.dot.svg: %.dot
	dot -Tsvg $< -o $@

# See .marprc.yml
$(PDF_FILE): julia_pe_slides.md svg
	marp --theme custom.css --pdf julia_pe_slides.md

clean:
	rm -f *.dot.svg
	rm -f $(PDF_FILE)
