function pr
    if ! type -q gpr
        command pr $argv
    else
        gpr $argv
    end
end
