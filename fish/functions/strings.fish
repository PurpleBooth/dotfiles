function strings
    if ! type -q gstrings
        command strings $argv
    else
        gstrings $argv
    end
end
