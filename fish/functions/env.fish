function env
    if ! type -q genv
        command env $argv
    else
        genv $argv
    end
end
