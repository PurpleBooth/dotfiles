function rmdir
    if ! type -q grmdir
        command rmdir $argv
    else
        grmdir $argv
    end
end
