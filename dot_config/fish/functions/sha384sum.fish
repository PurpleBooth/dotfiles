function sha384sum
    if ! type -q gsha384sum
        command sha384sum $argv
    else
        gsha384sum $argv
    end
end
