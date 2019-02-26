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
# Path                                                              #
#####################################################################

export PATH="${GOCODEDIR}/bin:${PATH}"
export PATH="${HOME}/.bin:${PATH}"

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

if brew command command-not-found-init > /dev/null 2>&1; then
  source <(brew command-not-found-init)
fi

#####################################################################
# Terminal Style                                                    #
#####################################################################

# Colours
export CLICOLOR=1
source <(gdircolors)

# ZPrezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Reverse Search
bindkey -M vicmd '?' history-incremental-search-backward

#####################################################################
# Aliases                                                           #
#####################################################################

alias realpath="grealpath"
alias more="less"

function whatismyip() { dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'; }
function ll() { ls -lrathF $@; }
function o() { fasd -ae open $@; }
function oo() { fasd -sae open $@; }
function git() { hub $@; } # This ensures auto-complete still works
function use_java () { export JAVA_HOME="$(/usr/libexec/java_home -v ${1})"; }

#####################################################################
# Update                                                            #
#####################################################################

# Everything
(PACKAGE_OUT=$(make -f "$CODEDIR/dotfiles/Makefile" "update" -j 10 2>&1) || echo "$PACKAGE_OUT") &! 