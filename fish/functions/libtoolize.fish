function libtoolize
    if ! type -q glibtoolize
        command libtoolize $argv
    else
        glibtoolize $argv
    end
end
