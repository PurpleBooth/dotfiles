#####################################################################
# Terminal Style                                                    #
#####################################################################

# Colours
export CLICOLOR=1
source <(gdircolors)

# ZPrezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
zprezto-update > /dev/null

# Brew
if brew command command-not-found-init > /dev/null 2>&1; then
  source <(brew command-not-found-init)
fi


#####################################################################
# Auto-completion                                                   #
#####################################################################

fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
source "$(brew --prefix)/share/zsh/site-functions"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source <(kubectl completion zsh)
source <(helm completion zsh)

#####################################################################
# Environment Variables                                             #
#####################################################################

export EDITOR="atom-beta --wait"
export VISUAL="${EDITOR}"
export GPG_TTY=$(tty)
export CODEDIR="$(grealpath ${HOME}/Code)"
export GOCODEDIR="${CODEDIR}/golang"
export GOPATH="${GOCODEDIR}"


#####################################################################
# Path                                                              #
#####################################################################

export PATH="${GOCODEDIR}/bin:${PATH}"
export PATH="${HOME}/.bin:${PATH}"


#####################################################################
# Aliases                                                           #
#####################################################################

alias atom="atom-beta"
alias grep="$(which grep) --color=always"
alias ll="$(which ls) -lrathF"
alias realpath="grealpath"
alias man="info"
alias more="less"
function git() { hub $@; } # This ensures auto-complete still works
