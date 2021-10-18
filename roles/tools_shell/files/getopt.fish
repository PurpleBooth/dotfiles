function getopt
    if ! type -q ggetopt
        command getopt $argv
    else
        ggetopt $argv
    end
end
