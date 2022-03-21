function sort
    if ! type -q gsort
        command sort $argv
    else
        gsort $argv
    end
end
