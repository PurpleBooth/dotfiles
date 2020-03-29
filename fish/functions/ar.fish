function ar
    if ! type -q gar
        command ar $argv
    else
        gar $argv
    end
end
