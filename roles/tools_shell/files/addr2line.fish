function addr2line
    if ! type -q gaddr2line
        command addr2line $argv
    else
        gaddr2line $argv
    end
end
