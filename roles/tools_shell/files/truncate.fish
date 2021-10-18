function truncate
    if ! type -q gtruncate
        command truncate $argv
    else
        gtruncate $argv
    end
end
