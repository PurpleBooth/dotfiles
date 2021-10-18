function tar
    if ! type -q gtar
        command tar $argv
    else
        gtar $argv
    end
end
