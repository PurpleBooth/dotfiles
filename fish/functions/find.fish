function find
    if ! type -q gfind
        command find $argv
    else
        gfind $argv
    end
end
