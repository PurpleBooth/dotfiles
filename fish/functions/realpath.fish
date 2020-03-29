function realpath
    if ! type -q grealpath
        command realpath $argv
    else
        grealpath $argv
    end
end
