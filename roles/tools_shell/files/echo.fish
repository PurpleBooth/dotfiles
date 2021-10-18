function echo
    if ! type -q gecho
        command echo $argv
    else
        gecho $argv
    end
end
