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

.PHONY: custom
custom: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: sh
sh: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: zsh
zsh: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: lsd
lsd: ## package
	@$(STOW) $(STOW_FLAGS) $@

# bash: sh ## package
# 	@$(STOW) $(STOW_FLAGS) $@

.PHONY: neovim
neovim: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: vim
vim: neovim ## alias

.PHONY: text-editor
text-editor: neovim ## solution

.PHONY: mpd
mpd: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: ncmpcpp
ncmpcpp: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: neofetch
neofetch: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: lf
lf: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: ranger
ranger: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: vifm
vifm: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: tmux
tmux: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: git
git: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: X
X: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: i3
i3: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: i3blocks
i3blocks: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: bspwm
bspwm: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: polybar
polybar: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: sxhkd
sxhkd: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: sxiv
sxiv: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: gtkwave
gtkwave: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: st
st: X ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: dmenu
dmenu: X ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: surf
surf: X ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: tabbed
tabbed: X ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: suckless
suckless: st dmenu surf tabbed

.PHONY: qutebrowser
qutebrowser: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: groff
groff: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: syncthing
syncthing: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: weechat
weechat: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: zathura
zathura: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: dunst
dunst: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: gdb
gdb: ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: gef
gef: gdb ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: lldb
lldb: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: neomutt
neomutt: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: isync
isync: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: notmuch
notmuch: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: abook
abook: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: mutt
mutt: neomutt ## alias

.PHONY: mail
mail: neomutt notmuch isync abook khard vdirsyncer ## solution

.PHONY: cava
cava: ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: pipe-viewer
pipe-viewer: ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: picom
picom: X ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: themix
themix: X ## package
	@$(STOW) $(STOW_FLAGS) $@
.PHONY: oomox
oomox: themix ## alias

.PHONY: lscolors
lscolors: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: bat
bat: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: kicad
kicad: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: tremc
tremc: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: khal
khal: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: khard
khard: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: vdirsyncer
vdirsyncer: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: todoman
todoman: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: lazygit
lazygit: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: newsboat
newsboat: ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: OpenSCAD
OpenSCAD: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY: boomer
boomer: X ## package
	@$(STOW) $(STOW_FLAGS) $@

.PHONY:help
help: ## list documented targets
	@grep -Eh '^[0-9a-zA-Z_-$$()]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[34m%-15s\033[0m %s\n", $$1, $$2}'
