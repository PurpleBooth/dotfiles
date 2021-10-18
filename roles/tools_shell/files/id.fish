function id
    if ! type -q gid
        command id $argv
    else
        gid $argv
    end
end
