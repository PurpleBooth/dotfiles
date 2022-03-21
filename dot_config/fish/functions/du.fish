function du
    if ! type -q gdu
        command du $argv
    else
        gdu $argv
    end
end
