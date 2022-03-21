function mkfifo
    if ! type -q gmkfifo
        command mkfifo $argv
    else
        gmkfifo $argv
    end
end
