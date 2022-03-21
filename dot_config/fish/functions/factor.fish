function factor
    if ! type -q gfactor
        command factor $argv
    else
        gfactor $argv
    end
end
