function gfmfmt
      for I in $argv
            set -lx TEMPORARY_FILE (mktemp -d)"/"(basename "$I")
            pandoc --from=gfm --to=gfm --wrap=auto $I > $TEMPORARY_FILE
            mv $TEMPORARY_FILE $I
      end
end
