function runcon
    if ! type -q gruncon
        command runcon $argv
    else
        gruncon $argv
    end
end
