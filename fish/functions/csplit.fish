function csplit
    if ! type -q gcsplit
        command csplit $argv
    else
        gcsplit $argv
    end
end
