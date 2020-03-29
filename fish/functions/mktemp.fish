function mktemp
    if ! type -q gmktemp
        command mktemp $argv
    else
        gmktemp $argv
    end
end
