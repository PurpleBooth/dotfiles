function unlink
    if ! type -q gunlink
        command unlink $argv
    else
        gunlink $argv
    end
end
