function sha1sum
    if ! type -q gsha1sum
        command sha1sum $argv
    else
        gsha1sum $argv
    end
end
