.DEFAULT_GOAL := show-help
# See <https://gist.github.com/klmr/575726c7e05d8780505a> for explanation.
.PHONY: show-help package-sync link-zsh zprezto-sync link-vim link-gnupg link-git-work link-git-home link-git sync-home sync-work sync


show-help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)";echo;sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## //;td" -e"s/:.*//;G;s/\\n## /---/;s/\\n/ /g;p;}" ${MAKEFILE_LIST}|LC_ALL='C' sort -f|awk -F --- -v n=$$(tput cols) -v i=19 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"%s%*s%s ",a,-i,$$1,z;m=split($$2,w," ");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;printf"\n%*s ",-i," ";}printf"%s ",w[j];}printf"\n";}'

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

## Install or update all the packages in the brewfile
package-sync:
	$(ROOT_DIR)/brew/bin/install
	$(ROOT_DIR)/brew/bin/bundle-install

## Link zsh config
link-zsh:
	$(ROOT_DIR)/zsh/bin/link

## Install and link zprezto
zprezto-sync:
	$(ROOT_DIR)/zprezto/bin/install
	$(ROOT_DIR)/zprezto/bin/link

## Link vim config
link-vim:
	$(ROOT_DIR)/vim/bin/link

## Link gnupg config
link-gnupg:
	$(ROOT_DIR)/gnupg/bin/link

## Link work git config
link-git-work: link-git
	$(ROOT_DIR)/git/bin/link-work

## Link home git config
link-git-home: link-git

## Link git config
link-git:
	$(ROOT_DIR)/git/bin/link

## Install and link all packages for home
sync-home: sync link-git-home

## Install and link all packages for work
sync-work: sync link-git-work

## Install and link all non-platform specific links
sync: package-sync zprezto-sync link-zsh link-vim link-gnupg link-git
