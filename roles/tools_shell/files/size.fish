function size
    if ! type -q gsize
        command size $argv
    else
        gsize $argv
    end
end
