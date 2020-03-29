function uptime
    if ! type -q guptime
        command uptime $argv
    else
        guptime $argv
    end
end
