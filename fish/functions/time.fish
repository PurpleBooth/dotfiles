function time
    if ! type -q gtime
        command time $argv
    else
        gtime $argv
    end
end
