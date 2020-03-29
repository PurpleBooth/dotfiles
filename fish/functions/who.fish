function who
    if ! type -q gwho
        command who $argv
    else
        gwho $argv
    end
end
