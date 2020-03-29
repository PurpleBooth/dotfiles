function date
    if ! type -q gdate
        command date $argv
    else
        gdate $argv
    end
end
