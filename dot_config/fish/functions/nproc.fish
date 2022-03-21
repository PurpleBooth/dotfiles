function nproc
    if ! type -q gnproc
        command nproc $argv
    else
        gnproc $argv
    end
end
