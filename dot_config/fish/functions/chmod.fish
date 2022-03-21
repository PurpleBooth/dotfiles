function chmod
    if ! type -q gchmod
        command chmod $argv
    else
        gchmod $argv
    end
end
