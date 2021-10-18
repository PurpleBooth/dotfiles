function rm
    if ! type -q grm
        command rm $argv
    else
        grm $argv
    end
end
