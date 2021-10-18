function od
    if ! type -q god
        command od $argv
    else
        god $argv
    end
end
