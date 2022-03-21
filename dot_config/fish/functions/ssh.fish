function ssh
    if ! type --quiet kitty
        command ssh $argv
    else
        kitty +kitten ssh $argv
    end
end
