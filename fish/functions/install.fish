function install
    if ! type -q ginstall
        command install $argv
    else
        ginstall $argv
    end
end
