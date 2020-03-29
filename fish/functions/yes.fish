function yes
    if ! type -q gyes
        command yes $argv
    else
        gyes $argv
    end
end
