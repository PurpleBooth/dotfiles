.PHONY: help

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

package-sync: # Install or update all the packages in the brewfile
	brew bundle --file=$(ROOT_DIR)/brew/Brewfile
