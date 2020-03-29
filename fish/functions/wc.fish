function wc
    if ! type -q gwc
        command wc $argv
    else
        gwc $argv
    end
end
