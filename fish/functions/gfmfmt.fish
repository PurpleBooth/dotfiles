function gfmfmt
      for I in $argv
            set -lx TEMPORARY_FILE (mktemp -d)
            pandoc --from=gfm --to=gfm --wrap=auto $I > $TEMPORARY_FILE/$I
            mv $TEMPORARY_FILE/$I $I
      end
end
