function readlink
    if ! type -q greadlink
        command readlink $argv
    else
        greadlink $argv
    end
end
