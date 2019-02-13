.DEFAULT_GOAL := show-help
# See <https://gist.github.com/klmr/575726c7e05d8780505a> for explanation.
.PHONY: show-help install-packages configure-zsh install-zprezto configure-vim configure-gnupg configure-git-for-work configure-git-for-home configure-git sync-home sync-work sync git-duet


show-help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)";echo;sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## //;td" -e"s/:.*//;G;s/\\n## /---/;s/\\n/ /g;p;}" ${MAKEFILE_LIST}|LC_ALL='C' sort -f|awk -F --- -v n=$$(tput cols) -v i=19 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"%s%*s%s ",a,-i,$$1,z;m=split($$2,w," ");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;printf"\n%*s ",-i," ";}printf"%s ",w[j];}printf"\n";}'

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

## Install or update all the packages in the brewfile
install-packages:
	"$(ROOT_DIR)/brew/bin/install"
	"$(ROOT_DIR)/brew/bin/bundle-install"

## Link zsh config
configure-zsh:
	"$(ROOT_DIR)/zsh/bin/link"

## Install and link zprezto
install-zprezto:
	"$(ROOT_DIR)/zprezto/bin/install"
	"$(ROOT_DIR)/zprezto/bin/link"

## Link vim config
configure-vim:
	"$(ROOT_DIR)/vim/bin/link"

## Link gnupg config
configure-gnupg:
	"$(ROOT_DIR)/gnupg/bin/link"

## Copy work git config
configure-git-for-work: configure-git
	"$(ROOT_DIR)/git/bin/copy-work"

## Copy home git config
configure-git-for-home: configure-git

## Copy git config
configure-git:
	"$(ROOT_DIR)/git/bin/copy"

## Link fasd config
configure-fasd:
	"$(ROOT_DIR)/fasd/bin/link"

## Link git-duet config and install git hooks
configure-git-duet:
	"$(ROOT_DIR)/git-duet/bin/link"
	"$(ROOT_DIR)/git-duet/bin/install-hooks"

## Configure all existing git repositories for git-duet
configure-git-repositories-for-git-duet: configure-git-duet
	"$(ROOT_DIR)/git-duet/bin/reinitialize-git-repositories"

## Install and link all packages for home
sync-home: sync configure-git-for-home

## Install and link all packages for work
sync-work: sync configure-git-for-work

## Install and link all non-platform specific links
sync: install-packages install-zprezto configure-zsh configure-fasd configure-vim configure-gnupg configure-git configure-git-duet
