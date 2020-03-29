function sha256sum
    if ! type -q gsha256sum
        command sha256sum $argv
    else
        gsha256sum $argv
    end
end
