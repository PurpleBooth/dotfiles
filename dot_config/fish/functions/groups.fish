function groups
    if ! type -q ggroups
        command groups $argv
    else
        ggroups $argv
    end
end
