function units
    if ! type -q gunits
        command units $argv
    else
        gunits $argv
    end
end
