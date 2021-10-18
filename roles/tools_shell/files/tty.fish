function tty
    if ! type -q gtty
        command tty $argv
    else
        gtty $argv
    end
end
