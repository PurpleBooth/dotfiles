function chown
    if ! type -q gchown
        command chown $argv
    else
        gchown $argv
    end
end
