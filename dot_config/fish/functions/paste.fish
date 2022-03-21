function paste
    if ! type -q gpaste
        command paste $argv
    else
        gpaste $argv
    end
end
