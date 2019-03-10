.DEFAULT_GOAL := show-help
THIS_FILE := $(lastword $(MAKEFILE_LIST))
ROOT_DIR:=$(shell dirname $(realpath $(THIS_FILE)))
SETUP_DEPS = install-packages configure-zsh configure-fasd configure-vim configure-gnupg configure-git configure-git-duet

.PHONY: show-help
# See <https://gist.github.com/klmr/575726c7e05d8780505a> for explanation.
## This help screen
show-help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)";echo;sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## //;td" -e"s/:.*//;G;s/\\n## /---/;s/\\n/ /g;p;}" ${MAKEFILE_LIST}|LC_ALL='C' sort -f|awk -F --- -v n=$$(tput cols) -v i=29 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"%s%*s%s ",a,-i,$$1,z;m=split($$2,w," ");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;printf"\n%*s ",-i," ";}printf"%s ",w[j];}printf"\n";}'

.PHONY: install-packages
## Install or update all the packages in the brewfile
install-packages:
	"$(ROOT_DIR)/brew/bin/install"
	"$(ROOT_DIR)/brew/bin/bundle-install"

.PHONY: configure-zsh
## Link zsh config
configure-zsh: install-packages
	"$(ROOT_DIR)/zsh/bin/link"
	"$(ROOT_DIR)/zsh/bin/make-default-shell"

.PHONY: configure-vim
## Link vim config
configure-vim: install-packages
	"$(ROOT_DIR)/vim/bin/link"

.PHONY: configure-gnupg
## Link gnupg config
configure-gnupg: install-packages
	"$(ROOT_DIR)/gnupg/bin/link"

.PHONY: configure-git-for-work
## Copy work git config
configure-git-for-work: configure-git
	"$(ROOT_DIR)/git/bin/copy-work"
	"$(ROOT_DIR)/git/bin/install-hook-work"

.PHONY: configure-git
## Copy git config
configure-git: install-packages
	"$(ROOT_DIR)/git/bin/copy"
	"$(ROOT_DIR)/git/bin/install-hook"

.PHONY: configure-fasd
## Link fasd config
configure-fasd: install-packages
	"$(ROOT_DIR)/fasd/bin/link"

.PHONY: configure-git-duet
## Link git-duet config and install git hooks
configure-git-duet: install-packages configure-git
	"$(ROOT_DIR)/git-duet/bin/link"
	"$(ROOT_DIR)/git-duet/bin/install-hooks"

.PHONY: reinitialize-git-repositories
## Configure all existing git repositories with hooks from templates
reinitialize-git-repositories: install-packages configure-git configure-git-duet
	"$(ROOT_DIR)/git/bin/reinitialize-git-repositories"

.PHONY: setup-home
## Install and link all packages for home
setup-home: $(SETUP_DEPS)
	@$(MAKE) -f $(THIS_FILE) test

.PHONY: setup-work
## Install and link all packages for work
setup-work: $(SETUP_DEPS) configure-git-for-work
	@$(MAKE) -f $(THIS_FILE) test

.PHONY: update
## Update assorted packages that benefit from being regularly kept up to date
update: install-packages update-tldr

.PHONY: update-tldr
## Update TLDR's documentation index
update-tldr: install-packages
	"$(ROOT_DIR)/tldr/bin/update"

.PHONY: generate-secret-envs
## Generate secrets env file from 1password
generate-secret-envs: install-packages
	"$(ROOT_DIR)/1password/bin/generate-envsecret"

.PHONY: test
## Test environment is setup
test:
	"$(ROOT_DIR)"/*/bin/test

.PHONY: lint
## Lint everything
lint: lint-shell

.PHONY: lint-shell
## Lint shell scripts
lint-shell: install-packages
	shfmt -f "$(ROOT_DIR)" | xargs shellcheck
	shfmt -d "$(ROOT_DIR)"

.PHONY: format-shell
## Format shell scripts
format-shell: install-packages
	shfmt -w -s "$(ROOT_DIR)"
