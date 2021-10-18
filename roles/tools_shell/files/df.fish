function df
    if ! type -q gdf
        command df $argv
    else
        gdf $argv
    end
end
