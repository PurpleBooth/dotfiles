function strip
    if ! type -q gstrip
        command strip $argv
    else
        gstrip $argv
    end
end
