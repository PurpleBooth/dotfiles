function updatedb
    if ! type -q gupdatedb
        command updatedb $argv
    else
        gupdatedb $argv
    end
end
