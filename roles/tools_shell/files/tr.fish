function tr
    if ! type -q gtr
        command tr $argv
    else
        gtr $argv
    end
end
