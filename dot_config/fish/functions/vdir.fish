function vdir
    if ! type -q gvdir
        command vdir $argv
    else
        gvdir $argv
    end
end
