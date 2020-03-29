function nice
    if ! type -q gnice
        command nice $argv
    else
        gnice $argv
    end
end
