function hostid
    if ! type -q ghostid
        command hostid $argv
    else
        ghostid $argv
    end
end
