function indent
    if ! type -q gindent
        command indent $argv
    else
        gindent $argv
    end
end
