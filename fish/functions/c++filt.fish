function c++filt
    if ! type -q gc++filt
        command c++filt $argv
    else
        gc++filt $argv
    end
end
