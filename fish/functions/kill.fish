function kill
    if ! type -q gkill
        command kill $argv
    else
        gkill $argv
    end
end
