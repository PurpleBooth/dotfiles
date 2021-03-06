#####################################################################
# Plugins                                                           #
#####################################################################

if not functions --query fisher
    set --query XDG_CONFIG_HOME; or set XDG_CONFIG_HOME "$HOME/.config"
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#####################################################################
# Path                                                              #
#####################################################################

set --global fish_user_paths "$GOCODEDIR/bin" $fish_user_paths
set --global fish_user_paths "$HOME/.bin" $fish_user_paths
set --global fish_user_paths (brew --prefix)"/opt/curl/bin" $fish_user_paths
set --global fish_user_paths (brew --prefix)"/opt/mysql-client/bin" $fish_user_paths
set --global fish_user_paths (brew --prefix)"/texlive/2019/bin/x86_64-darwin/" $fish_user_paths
set --global fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set --global fish_user_paths "/usr/local/sbin" $fish_user_paths

#####################################################################
# Globals                                                           #
#####################################################################

# System Defaults
set --global --export LC_ALL "de_DE.UTF-8"
set --global --export LANG "$LC_ALL"
set --global --export TZ "Europe/Berlin"

# XDG
set --global --export XDG_CONFIG_HOME "$HOME/.config"
set --global --export XDG_CACHE_HOME "$HOME/Library/Caches/"
set --global --export XDG_DATA_HOME "$HOME/.local/share"
set --global --export XDG_RUNTIME_DIR "$HOME/Library/Caches/run"

# Git-mit
set --global --export GIT_MIT_AUTHORS_EXEC "bash -c 'CLOUDSDK_ACTIVE_CONFIG_NAME=\"secret-store\" sops -d \"\$XDG_CONFIG_HOME/git-mit/authors.yml\"'"

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/billie/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/billie/.ghcup/bin $PATH


