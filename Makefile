include Makefile.conf

.PHONY: all
all: $(PACKAGES)

.PHONY: install
install:
	@$(PACKAGE_MANAGER) $(PACKAGE_MANAGER_FLAGS_INSTALL) - < $(PKGLIST)

.PHONY: $(PKGLIST)
$(PKGLIST):
	@$(PACKAGE_MANAGER) $(PACKAGE_MANAGER_FLAGS_LIST_INSTALLED_PACKAGES) | tee $@

.PHONY: $(PACKAGES)
custom:
	@$(STOW) $(STOW_FLAGS) $@
zsh: bash
	@$(STOW) $(STOW_FLAGS) $@
bash: sh
	@$(STOW) $(STOW_FLAGS) $@
sh:
	@$(STOW) $(STOW_FLAGS) $@
vim:
	@$(STOW) $(STOW_FLAGS) $@
ranger:
	@$(STOW) $(STOW_FLAGS) $@
vifm:
	@$(STOW) $(STOW_FLAGS) $@
tmux:
	@$(STOW) $(STOW_FLAGS) $@
git:
	@$(STOW) $(STOW_FLAGS) $@
X:
	@$(STOW) $(STOW_FLAGS) $@
i3: X
	@$(STOW) $(STOW_FLAGS) $@
st: X
	@$(STOW) $(STOW_FLAGS) $@
dmenu: X
	@$(STOW) $(STOW_FLAGS) $@
surf: X
	@$(STOW) $(STOW_FLAGS) $@
groff:
	@$(STOW) $(STOW_FLAGS) $@
mozilla: X
	@$(STOW) $(STOW_FLAGS) $@
syncthing: X
	@$(STOW) $(STOW_FLAGS) $@
weechat:
	@$(STOW) $(STOW_FLAGS) $@
zathura: X
	@$(STOW) $(STOW_FLAGS) $@
dunst: X
	@$(STOW) $(STOW_FLAGS) $@
gef: gdb
	@$(STOW) $(STOW_FLAGS) $@
gdb:
	@$(STOW) $(STOW_FLAGS) $@
lldb:
	@$(STOW) $(STOW_FLAGS) $@
ghidra: X
	@$(STOW) $(STOW_FLAGS) $@
other:
	@$(STOW) $(STOW_FLAGS) $@
