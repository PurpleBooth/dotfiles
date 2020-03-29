function mkdir
    if ! type -q gmkdir
        command mkdir $argv
    else
        gmkdir $argv
    end
end
