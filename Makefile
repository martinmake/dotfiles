BOOTSTRAP_MAKEFILE:=./script/bootstrap.makefile
BOOTSTRAPPED_MAKEFILES:=$(filter-out $(BOOTSTRAP_MAKEFILE),$(wildcard ./script/*.makefile))
include $(or $(BOOTSTRAPPED_MAKEFILES),$(BOOTSTRAP_MAKEFILE))

.PHONY: help
help: ## List documented targets.
	@echo -e "\033[31mTargets:\033[0m"
	@grep -Eh '^[^[:blank:]]+:.* ## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.* ## "}; {printf "\t\033[36m%-'$$(sed -n 's/^\([^[:blank:]].*\):.* ## .*$$/\1/p' $(MAKEFILE_LIST) | wc -L | cut -d" " -f1)'s \033[32m%s \033[30m# make %s\033[0m\n", $$1, $$2, $$1}'
