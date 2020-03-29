function touch
    if ! type -q gtouch
        command touch $argv
    else
        gtouch $argv
    end
end
