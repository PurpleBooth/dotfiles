function join
    if ! type -q gjoin
        command join $argv
    else
        gjoin $argv
    end
end
