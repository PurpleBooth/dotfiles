function sed
    if ! type -q gsed
        command sed $argv
    else
        gsed $argv
    end
end
