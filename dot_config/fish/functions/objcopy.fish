function objcopy
    if ! type -q gobjcopy
        command objcopy $argv
    else
        gobjcopy $argv
    end
end
