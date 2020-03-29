function expr
    if ! type -q gexpr
        command expr $argv
    else
        gexpr $argv
    end
end
