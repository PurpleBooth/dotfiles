function basename
    if ! type -q gbasename
        command basename $argv
    else
        gbasename $argv
    end
end
