function fold
    if ! type -q gfold
        command fold $argv
    else
        gfold $argv
    end
end
