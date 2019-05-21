#####################################################################
# Environment Variables                                             #
#####################################################################

# System Defaults
export EDITOR="vim"
export VISUAL="${EDITOR}"
export LC_ALL="de_DE.UTF-8"
export LANG="$LC_ALL"

# GPG
export GPG_TTY=$(tty)

# Favourites
export CODEDIR="$(grealpath ${HOME}/Code)"

# Golang
export GOCODEDIR="${CODEDIR}/golang"
export GOPATH="${GOCODEDIR}"

# Git Duet
export GIT_DUET_CO_AUTHORED_BY="1"
export GIT_DUET_GLOBAL="1"

# Zplug
export ZPLUG_HOME="$(brew --prefix)/opt/zplug"

# Not committed
if [ -f "${HOME}/.envsecret" ]; then
    source "${HOME}/.envsecret"
fi

#####################################################################
# Path                                                              #
#####################################################################

export PATH="${GOCODEDIR}/bin:${PATH}"
export PATH="${HOME}/.bin:${PATH}"

#####################################################################
# Terminal Style                                                    #
#####################################################################

# Colours
export CLICOLOR=1
source <(gdircolors)

# ZSH
setopt auto_cd
zmodload zsh/terminfo

# ZPlug
source "$ZPLUG_HOME/init.zsh"

zplug "lib/history", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "modules/gnu-utility", from:prezto
zplug "modules/fasd", from:prezto
zplug "b4b4r07/enhancd", use:init.sh
zplug "dracula/zsh", as:theme

ZPLUG_MTIME_FILE="$HOME/.zplug"

if ! zplug check --verbose; then
    zplug install
else
    if ! [ -f "$ZPLUG_MTIME_FILE" ] || [ -n "$(find "$ZPLUG_MTIME_FILE" -mmin +$((60 * 24 * 30)))" ]; then
        touch "$ZPLUG_MTIME_FILE"
        zplug update
    fi
fi

if zplug check "zsh-users/zsh-autosuggestions"; then
  export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"
fi

if zplug check "b4b4r07/enhancd"; then
  export ENHANCD_DISABLE_DOT="1"
  export ENHANCD_DISABLE_HYPHEN="1"
  export ENHANCD_DOT_SHOW_FULLPATH="1"
fi

zplug load

if zplug check zsh-users/zsh-autosuggestions; then
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
fi

if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '\eOA' history-substring-search-up
    bindkey '\eOB' history-substring-search-down
fi


#####################################################################
# Auto-Complete                                                     #
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
source "${HOME}/.travis/travis.sh"

if brew command command-not-found-init > /dev/null 2>&1; then
  source <(brew command-not-found-init)
fi

#####################################################################
# Aliases                                                           #
#####################################################################

alias realpath="grealpath"
alias more="less"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

function whatismyip() { dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'; }
function ll() { ls -lrathF $@; }
function o() { fasd -ae open $@; }
function oo() { fasd -sae open $@; }
function git() { hub $@; } # This ensures auto-complete still works
function use_java () { export JAVA_HOME="$(/usr/libexec/java_home -v ${1})"; }
alias python=python3
alias pip=pip3

#####################################################################
# Update                                                            #
#####################################################################

# Everything
(PACKAGE_OUT=$(make -f "$CODEDIR"/dotfiles/Makefile "update" -j 10 2>&1) || echo "$PACKAGE_OUT") &!


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
