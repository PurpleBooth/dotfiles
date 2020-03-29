function mv
    if ! type -q gmv
        command mv $argv
    else
        gmv $argv
    end
end
