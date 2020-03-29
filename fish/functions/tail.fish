function tail
    if ! type -q gtail
        command tail $argv
    else
        gtail $argv
    end
end
