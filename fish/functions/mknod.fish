function mknod
    if ! type -q gmknod
        command mknod $argv
    else
        gmknod $argv
    end
end
