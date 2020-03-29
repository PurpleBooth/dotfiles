function nm
    if ! type -q gnm
        command nm $argv
    else
        gnm $argv
    end
end
