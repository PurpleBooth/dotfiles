function pathchk
    if ! type -q gpathchk
        command pathchk $argv
    else
        gpathchk $argv
    end
end
