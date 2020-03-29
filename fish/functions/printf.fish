function printf
    if ! type -q gprintf
        command printf $argv
    else
        gprintf $argv
    end
end
