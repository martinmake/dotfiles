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
	@$(PACGRAPH) $(PACGRAPH_FLAGS)

.PHONY: $(PACKAGES)
custom: ## package
	@$(STOW) $(STOW_FLAGS) $@
sh: ## package
	@$(STOW) $(STOW_FLAGS) $@
zsh: ## package
	@$(STOW) $(STOW_FLAGS) $@
# bash: sh ## package
# 	@$(STOW) $(STOW_FLAGS) $@
neovim: ## package
	@$(STOW) $(STOW_FLAGS) $@
vim: neovim ## alias
text-editor: neovim ## solution
mpd: ## package
	@$(STOW) $(STOW_FLAGS) $@
ncmpcpp: ## package
	@$(STOW) $(STOW_FLAGS) $@
neofetch: ## package
	@$(STOW) $(STOW_FLAGS) $@
lf: ## package
	@$(STOW) $(STOW_FLAGS) $@
ranger: ## package
	@$(STOW) $(STOW_FLAGS) $@
vifm: ## package
	@$(STOW) $(STOW_FLAGS) $@
tmux: ## package
	@$(STOW) $(STOW_FLAGS) $@
git: ## package
	@$(STOW) $(STOW_FLAGS) $@
X: ## package
	@$(STOW) $(STOW_FLAGS) $@
i3: X ## package
	@$(STOW) $(STOW_FLAGS) $@
i3blocks: X ## package
	@$(STOW) $(STOW_FLAGS) $@
bspwm: X ## package
	@$(STOW) $(STOW_FLAGS) $@
polybar: X ## package
	@$(STOW) $(STOW_FLAGS) $@
sxhkd: X ## package
	@$(STOW) $(STOW_FLAGS) $@
sxiv: X ## package
	@$(STOW) $(STOW_FLAGS) $@
gtkwave: X ## package
	@$(STOW) $(STOW_FLAGS) $@
st: X ## package
	@$(STOW) $(STOW_FLAGS) $@
dmenu: X ## package
	@$(STOW) $(STOW_FLAGS) $@
surf: X ## package
	@$(STOW) $(STOW_FLAGS) $@
tabbed: X ## package
	@$(STOW) $(STOW_FLAGS) $@
groff: ## package
	@$(STOW) $(STOW_FLAGS) $@
syncthing: X ## package
	@$(STOW) $(STOW_FLAGS) $@
weechat: ## package
	@$(STOW) $(STOW_FLAGS) $@
zathura: X ## package
	@$(STOW) $(STOW_FLAGS) $@
dunst: X ## package
	@$(STOW) $(STOW_FLAGS) $@
gdb: ## package
	@$(STOW) $(STOW_FLAGS) $@
gef: gdb ## package
	@$(STOW) $(STOW_FLAGS) $@
lldb: ## package
	@$(STOW) $(STOW_FLAGS) $@
neomutt: ## package
	@$(STOW) $(STOW_FLAGS) $@
notmuch: ## package
	@$(STOW) $(STOW_FLAGS) $@
mutt: neomutt ## alias
mail: neomutt notmuch ## solution
cava: ## package
	@$(STOW) $(STOW_FLAGS) $@
pipe-viewer: ## package
	@$(STOW) $(STOW_FLAGS) $@
picom: X ## package
	@$(STOW) $(STOW_FLAGS) $@
themix: X ## package
	@$(STOW) $(STOW_FLAGS) $@
oomox: themix ## alias
lscolors: ## package
	@$(STOW) $(STOW_FLAGS) $@
kicad: X ## package
	@$(STOW) $(STOW_FLAGS) $@
tremc: ## package
	@$(STOW) $(STOW_FLAGS) $@
khal: ## package
	@$(STOW) $(STOW_FLAGS) $@
khard: ## package
	@$(STOW) $(STOW_FLAGS) $@
todoman: ## package
	@$(STOW) $(STOW_FLAGS) $@
newsboat: ## package
	@$(STOW) $(STOW_FLAGS) $@
OpenSCAD: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY:help
help: ## lists documented targets
	@grep -Eh '^[0-9a-zA-Z_-$$()]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
