function oldfind
    if ! type -q goldfind
        command oldfind $argv
    else
        goldfind $argv
    end
end
