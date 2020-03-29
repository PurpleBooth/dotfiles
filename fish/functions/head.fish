function head
    if ! type -q ghead
        command head $argv
    else
        ghead $argv
    end
end
