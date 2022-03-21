function tee
    if ! type -q gtee
        command tee $argv
    else
        gtee $argv
    end
end
