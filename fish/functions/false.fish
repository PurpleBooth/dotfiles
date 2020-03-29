function false
    if ! type -q gfalse
        command false $argv
    else
        gfalse $argv
    end
end
