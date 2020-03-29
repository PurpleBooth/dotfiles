function pinee
    if ! type -q gpinee
        command pinee $argv
    else
        gpinee $argv
    end
end
