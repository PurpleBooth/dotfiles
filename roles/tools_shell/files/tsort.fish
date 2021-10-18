function tsort
    if ! type -q gtsort
        command tsort $argv
    else
        gtsort $argv
    end
end
