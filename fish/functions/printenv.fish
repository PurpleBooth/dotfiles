function printenv
    if ! type -q gprintenv
        command printenv $argv
    else
        gprintenv $argv
    end
end
