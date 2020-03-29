function sync
    if ! type -q gsync
        command sync $argv
    else
        gsync $argv
    end
end
