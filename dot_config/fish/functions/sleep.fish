function sleep
    if ! type -q gsleep
        command sleep $argv
    else
        gsleep $argv
    end
end
