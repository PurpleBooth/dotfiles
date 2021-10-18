function dir
    if ! type -q gdir
        command dir $argv
    else
        gdir $argv
    end
end
