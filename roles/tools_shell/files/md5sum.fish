function md5sum
    if ! type -q gmd5sum
        command md5sum $argv
    else
        gmd5sum $argv
    end
end
