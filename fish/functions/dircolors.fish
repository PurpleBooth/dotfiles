function dircolors
    if ! type -q gdircolors
        command dircolors $argv
    else
        gdircolors $argv
    end
end
