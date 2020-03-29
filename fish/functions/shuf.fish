function shuf
    if ! type -q gshuf
        command shuf $argv
    else
        gshuf $argv
    end
end
