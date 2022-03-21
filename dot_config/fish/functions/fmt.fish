function fmt
    if ! type -q gfmt
        command fmt $argv
    else
        gfmt $argv
    end
end
