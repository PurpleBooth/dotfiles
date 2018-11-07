#####################################################################
# Terminal Style                                                    #
#####################################################################

# Colours
export CLICOLOR=1
source <(gdircolors)

# Brew
if brew command command-not-found-init > /dev/null 2>&1; then
  source <(brew command-not-found-init)
fi

export SPACESHIP_EXIT_CODE_SHOW="true"
export SPACESHIP_GIT_STATUS_ADDED="✚ "
export SPACESHIP_GIT_STATUS_MODIFIED="✹ "
export SPACESHIP_GIT_STATUS_DELETED="✖ "
export SPACESHIP_GIT_STATUS_RENAMED="➜ "
export SPACESHIP_GIT_STATUS_UNMERGED="═ "
export SPACESHIP_GIT_STATUS_UNTRACKED="✭ "
export SPACESHIP_GIT_STATUS_STASHED="§ "
export SPACESHIP_GIT_STATUS_PREFIX=" "
export SPACESHIP_GIT_STATUS_SUFFIX=""

# ZPrezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
bindkey '^R' history-incremental-search-backward

#####################################################################
# Auto-completion                                                   #
#####################################################################

fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
source "$(brew --prefix)/share/zsh/site-functions"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source <(fasd --init auto)
source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(helm completion zsh)
source "${HOME}/.cargo/env"

#####################################################################
# Environment Variables                                             #
#####################################################################
export EDITOR="vim"
export VISUAL="${EDITOR}"
export GPG_TTY=$(tty)
export CODEDIR="$(grealpath ${HOME}/Code)"
export GOCODEDIR="${CODEDIR}/golang"
export GOPATH="${GOCODEDIR}"
export GIT_DUET_CO_AUTHORED_BY="1"
export GIT_DUET_GLOBAL="1"

if [ -f "${HOME}/.envsecret" ]; then
    source "${HOME}/.envsecret"
fi

#####################################################################
# Functions                                                         #
#####################################################################

function use_java () {
  export JAVA_HOME="$(/usr/libexec/java_home -v ${1})"
}

#####################################################################
# Path                                                              #
#####################################################################

export PATH="${GOCODEDIR}/bin:${PATH}"
export PATH="${HOME}/.bin:${PATH}"

#####################################################################
# Aliases                                                           #
#####################################################################

alias whatismyip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'\''"'\'' '\''{ print $2}'\'''
alias zsh-rc-reload="builtin . ~/.zshrc"
alias atom="atom-beta"
alias apm="apm-beta"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -lrathF"
alias realpath="grealpath"
alias more="less"
alias o="fasd -ae open"
alias oo="fasd -sae open"

function git() { hub $@; } # This ensures auto-complete still works

#####################################################################
# Update                                                            #
#####################################################################

# TLDR Autoupdate
tldr --update &!

# Packages
($PACKAGE_OUT=$(make -f "$CODEDIR/dotfiles/Makefile" "sync-$LAPTOP_NAME" 2>&1) || echo "$PACKAGE_OUT") &!
