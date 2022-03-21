function readelf
    if ! type -q greadelf
        command readelf $argv
    else
        greadelf $argv
    end
end
