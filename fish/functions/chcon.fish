function chcon
    if ! type -q gchcon
        command chcon $argv
    else
        gchcon $argv
    end
end
