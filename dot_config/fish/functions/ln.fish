function ln
    if ! type -q gln
        command ln $argv
    else
        gln $argv
    end
end
