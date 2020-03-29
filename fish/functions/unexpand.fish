function unexpand
    if ! type -q gunexpand
        command unexpand $argv
    else
        gunexpand $argv
    end
end
