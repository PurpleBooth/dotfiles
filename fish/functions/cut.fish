function cut
    if ! type -q gcut
        command cut $argv
    else
        gcut $argv
    end
end
