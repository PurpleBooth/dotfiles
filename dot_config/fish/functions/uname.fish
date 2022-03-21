function uname
    if ! type -q guname
        command uname $argv
    else
        guname $argv
    end
end
