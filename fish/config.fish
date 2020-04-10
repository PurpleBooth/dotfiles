#####################################################################
# Plugins                                                           #
#####################################################################

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME "$HOME/.config"
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#####################################################################
# Environment Variables                                             #
#####################################################################

# System Defaults
set  --universal --export EDITOR "vim"
set  --universal --export VISUAL "$EDITOR"
set  --universal --export LC_ALL "de_DE.UTF-8"
set  --universal --export LANG "$LC_ALL"

# XDG
set  --universal --export XDG_CONFIG_HOME "$HOME/.config"
set  --universal --export XDG_CACHE_HOME "$HOME/Library/Caches/"
set  --universal --export XDG_DATA_HOME "$HOME/.local/share"
set  --universal --export XDG_RUNTIME_DIR "$HOME/Library/Caches/run"

# Vim
set  --universal --export VIMINIT ":source $XDG_CONFIG_HOME"/vim/.vimrc

# GPG
set  --universal --export GNUPGHOME "$XDG_DATA_HOME/gnupg"
set  --universal --export GPG_TTY (tty)

# Favourites
set  --universal --export CODEDIR (grealpath $HOME/Code)

# Golang
set  --universal --export GOCODEDIR "$CODEDIR/golang"
set  --universal --export GOPATH "$GOCODEDIR"

# Git Duet
set  --universal --export GIT_DUET_CO_AUTHORED_BY "1"
set  --universal --export GIT_DUET_SET_GIT_USER_CONFIG "1"
set  --universal --export GIT_DUET_AUTHORS_FILE "$XDG_CONFIG_HOME/git-duet/authors.yml"

# Shell Name
set  --universal --export SHELL_NAME "fish"

# Not committed
if [ -f "$HOME/.config/envsecret/envsecret.sourceable.fish" ]
    eval (
      sops \
        exec-file \
        "$HOME/.config/envsecret/envsecret.sourceable.fish" \
        'cat "{}"'
    )
end

#####################################################################
# Path                                                              #
#####################################################################

set  --universal --export PATH "$GOCODEDIR/bin" $PATH
set  --universal --export PATH "$HOME/.bin" $PATH
set  --universal --export PATH (brew --prefix)"/opt/mysql-client/bin" $PATH
set  --universal --export PATH (brew --prefix)"/texlive/2019/bin/x86_64-darwin/" $PATH

#####################################################################
# Autocomplete                                                      #
#####################################################################

brew command command-not-found-init > /dev/null; and . (brew command-not-found-init)

if type -q kitty
    kitty + complete setup fish | source $argv
end


#####################################################################
# Terminal Style                                                    #
#####################################################################

# Colours
set  --universal --export CLICOLOR 1
set  --universal --export LS_COLORS (dircolors -c $colorfile | string split ' ')[3]

# History Search
source (brew --prefix)"/opt/fzf/shell/key-bindings.fish"

## Starship
if type -q starship
    starship init fish | source
end

