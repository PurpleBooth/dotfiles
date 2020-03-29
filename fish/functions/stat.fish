function stat
    if ! type -q gstat
        command stat $argv
    else
        gstat $argv
    end
end
