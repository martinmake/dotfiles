.PHONY: all
all: bootstrap ## @bootstrap and make
	$(MAKE)

.PHONY: bootstrap
bootstrap: ## Bootstrap home setup.
	emacs --quick --batch --load=org \
		--execute='(org-babel-tangle-file "./source/Home.org")'
