function cksum
    if ! type -q gcksum
        command cksum $argv
    else
        gcksum $argv
    end
end
