function users
    if ! type -q gusers
        command users $argv
    else
        gusers $argv
    end
end
