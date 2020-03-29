function xargs
    if ! type -q gxargs
        command xargs $argv
    else
        gxargs $argv
    end
end
