function sha224sum
    if ! type -q gsha224sum
        command sha224sum $argv
    else
        gsha224sum $argv
    end
end
