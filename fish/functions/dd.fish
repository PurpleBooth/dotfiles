function dd
    if ! type -q gdd
        command dd $argv
    else
        gdd $argv
    end
end
