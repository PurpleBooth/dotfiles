function configure
    if ! type -q gconfigure
        command configure $argv
    else
        gconfigure $argv
    end
end
