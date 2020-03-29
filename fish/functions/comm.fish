function comm
    if ! type -q gcomm
        command comm $argv
    else
        gcomm $argv
    end
end
