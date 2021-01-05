BDIR:=$(realpath .)/build
SDIR:=$(realpath .)
BASE:=$(realpath .)/base.css

INPUT_STYLES:=$(shell find $(SDIR) -name '*.css' -not -name 'base.css' -not -path '$(BDIR)/*')
COMPILED_STYLES:=$(patsubst $(SDIR)/%.css, $(BDIR)/%.css,$(INPUT_STYLES))

.PHONY: all
all: $(COMPILED_STYLES)

$(BDIR)/%.css: $(SDIR)/%.css $(BASE)
	cat $(BASE) $< > $@

.PHONY: clean
clean:
	rm $(BDIR)/*.css
