function dirname
    if ! type -q gdirname
        command dirname $argv
    else
        gdirname $argv
    end
end
