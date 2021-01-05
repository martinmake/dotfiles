include Makefile.conf

.PHONY: all
all: $(PACKAGES) ## links all package files

.PHONY: install
install: ## installs all packages in pkglist via $(PACKAGE_MANAGER)
	@$(PACKAGE_MANAGER) $(PACKAGE_MANAGER_FLAGS_INSTALL) - < pkglist

.PHONY: pkglist
pkglist: ## creates/updates pkglist with packages currently maintained by $(PACKAGE_MANAGER)
	@$(PACKAGE_MANAGER) $(PACKAGE_MANAGER_FLAGS_LIST_INSTALLED_PACKAGES) | tee $@

.PHONY: pacgraph
pacgraph: ## draws a graph of installed packages to PNG and SVG
	$(PACGRAPH) $(PACGRAPH_FLAGS)

.PHONY: $(PACKAGES)
custom: ## package
	@$(STOW) $(STOW_FLAGS) $@
zsh: bash ## package
	@$(STOW) $(STOW_FLAGS) $@
bash: sh ## package
	@$(STOW) $(STOW_FLAGS) $@
sh: ## package
	@$(STOW) $(STOW_FLAGS) $@
neovim: ## package
	@$(STOW) $(STOW_FLAGS) $@
vim: neovim ## alias
	@$(STOW) $(STOW_FLAGS) $@
text-editor: neovim ## solution
	@$(STOW) $(STOW_FLAGS) $@
ranger: ## package
	@$(STOW) $(STOW_FLAGS) $@
vifm: ## package
	@$(STOW) $(STOW_FLAGS) $@
tmux: ## package
	@$(STOW) $(STOW_FLAGS) $@
git: ## package
	@$(STOW) $(STOW_FLAGS) $@
X: ## solution
	@$(STOW) $(STOW_FLAGS) $@
i3: X ## package
	@$(STOW) $(STOW_FLAGS) $@
bspwm: X ## package
	@$(STOW) $(STOW_FLAGS) $@
st: X ## package
	@$(STOW) $(STOW_FLAGS) $@
dmenu: X ## package
	@$(STOW) $(STOW_FLAGS) $@
surf: X ## package
	@$(STOW) $(STOW_FLAGS) $@
groff: ## package
	@$(STOW) $(STOW_FLAGS) $@
mozilla: X ## package
	@$(STOW) $(STOW_FLAGS) $@
syncthing: X ## package
	@$(STOW) $(STOW_FLAGS) $@
weechat: ## package
	@$(STOW) $(STOW_FLAGS) $@
zathura: X ## package
	@$(STOW) $(STOW_FLAGS) $@
dunst: X ## package
	@$(STOW) $(STOW_FLAGS) $@
gef: gdb ## package
	@$(STOW) $(STOW_FLAGS) $@
gdb: ## package
	@$(STOW) $(STOW_FLAGS) $@
lldb: ## package
	@$(STOW) $(STOW_FLAGS) $@
ghidra: X ## package
	@$(STOW) $(STOW_FLAGS) $@
mutt: ## package
	@$(STOW) $(STOW_FLAGS) $@
mail: mutt ## solution
	@$(STOW) $(STOW_FLAGS) $@
other: ## package
	@$(STOW) $(STOW_FLAGS) $@


.PHONY:help
help: ## lists documented targets
	@grep -Eh '^[0-9a-zA-Z_-$$()]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
