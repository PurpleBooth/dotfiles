function pwd
    if ! type -q gpwd
        command pwd $argv
    else
        gpwd $argv
    end
end
