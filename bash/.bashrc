# Shell Name
export SHELL_NAME="bash"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/Library/Caches/"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/Library/Caches/run"

function gfmfmt() {
  for I in "$@"; do
    TEMPORARY_FILE="$(mktemp -d)"
    pandoc --from=gfm --to=gfm --wrap=auto "$I" >"$TEMPORARY_FILE/$I"
    mv "$TEMPORARY_FILE/$I" "$I"
  done
}

eval "$(starship init bash)"
