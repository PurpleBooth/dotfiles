function objdump
    if ! type -q gobjdump
        command objdump $argv
    else
        gobjdump $argv
    end
end
