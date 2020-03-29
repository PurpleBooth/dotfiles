function cp
    if ! type -q gcp
        command cp $argv
    else
        gcp $argv
    end
end
