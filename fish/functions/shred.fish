function shred
    if ! type -q gshred
        command shred $argv
    else
        gshred $argv
    end
end
