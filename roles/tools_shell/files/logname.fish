function logname
    if ! type -q glogname
        command logname $argv
    else
        glogname $argv
    end
end
