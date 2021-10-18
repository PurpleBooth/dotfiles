function which
    if ! type -q gwhich
        command which $argv
    else
        gwhich $argv
    end
end
