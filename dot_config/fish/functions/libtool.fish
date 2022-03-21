function libtool
    if ! type -q glibtool
        command libtool $argv
    else
        glibtool $argv
    end
end
