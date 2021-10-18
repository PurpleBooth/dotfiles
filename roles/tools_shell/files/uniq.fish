function uniq
    if ! type -q guniq
        command uniq $argv
    else
        guniq $argv
    end
end
