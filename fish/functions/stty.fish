function stty
    if ! type -q gstty
        command stty $argv
    else
        gstty $argv
    end
end
