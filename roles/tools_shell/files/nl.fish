function nl
    if ! type -q gnl
        command nl $argv
    else
        gnl $argv
    end
end
