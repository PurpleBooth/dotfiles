function locate
    if ! type -q glocate
        command locate $argv
    else
        glocate $argv
    end
end
