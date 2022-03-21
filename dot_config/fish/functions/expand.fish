function expand
    if ! type -q gexpand
        command expand $argv
    else
        gexpand $argv
    end
end
