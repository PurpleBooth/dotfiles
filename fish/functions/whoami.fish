function whoami
    if ! type -q gwhoami
        command whoami $argv
    else
        gwhoami $argv
    end
end
