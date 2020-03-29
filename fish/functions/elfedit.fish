function elfedit
    if ! type -q gelfedit
        command elfedit $argv
    else
        gelfedit $argv
    end
end
