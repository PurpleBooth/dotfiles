function sha512sum
    if ! type -q gsha512sum
        command sha512sum $argv
    else
        gsha512sum $argv
    end
end
