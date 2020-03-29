function sum
    if ! type -q gsum
        command sum $argv
    else
        gsum $argv
    end
end
