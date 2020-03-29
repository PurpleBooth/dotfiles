function ranlib
    if ! type -q granlib
        command ranlib $argv
    else
        granlib $argv
    end
end
