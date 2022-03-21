.DEFAULT_GOAL := show-help
THIS_FILE := $(lastword $(MAKEFILE_LIST))
ROOT_DIR:=$(shell dirname $(realpath $(THIS_FILE)))

.PHONY: show-help
# See <https://gist.github.com/klmr/575726c7e05d8780505a> for explanation.
## This help screen
show-help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)";echo;sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## //;td" -e"s/:.*//;G;s/\\n## /---/;s/\\n/ /g;p;}" ${MAKEFILE_LIST}|LC_ALL='C' sort -f|awk -F --- -v n=$$(tput cols) -v i=29 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"%s%*s%s ",a,-i,$$1,z;m=split($$2,w," ");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;printf"\n%*s ",-i," ";}printf"%s ",w[j];}printf"\n";}'

.PHONY: setup-home
## Install and link all packages for home
setup-home:
	sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply PurpleBooth

.PHONY: setup-work
## Install and link all packages for work
setup-work: setup-home

.PHONY: format
## Format any yaml files
format:
	find . \( -iname "*.yml" -o -iname "*.yaml" \) -exec yamlfmt --write {} \;
	shfmt -w -s $(shell shfmt -f $(shell find "$PWD" -maxdepth 1 -mindepth 1 -type d ))
	find "$(ROOT_DIR)" -name "*.fish" -o -name "*.fish.template" -exec fish_indent -w {} \;
	fish -c "cd $(ROOT_DIR)/ && gfmfmt **.md"
