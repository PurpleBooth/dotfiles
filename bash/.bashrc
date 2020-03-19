# Shell Name
export SHELL_NAME="bash"

function gfmfmt() {
  for I in "$@"; do
    TEMPORARY_FILE="$(mktemp -d)"
    pandoc --from=gfm --to=gfm --wrap=auto "$I" >"$TEMPORARY_FILE/$I"
    mv "$TEMPORARY_FILE/$I" "$I"
  done
}

eval "$(starship init bash)"
