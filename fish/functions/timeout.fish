function timeout
    if ! type -q gtimeout
        command timeout $argv
    else
        gtimeout $argv
    end
end
