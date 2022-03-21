function true
    if ! type -q gtrue
        command true $argv
    else
        gtrue $argv
    end
end
