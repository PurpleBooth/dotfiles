function base64
    if ! type -q gbase64
        command base64 $argv
    else
        gbase64 $argv
    end
end
