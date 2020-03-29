function split
    if ! type -q gsplit
        command split $argv
    else
        gsplit $argv
    end
end
