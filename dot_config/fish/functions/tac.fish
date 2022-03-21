function tac
    if ! type -q gtac
        command tac $argv
    else
        gtac $argv
    end
end
