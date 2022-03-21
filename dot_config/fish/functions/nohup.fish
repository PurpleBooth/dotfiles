function nohup
    if ! type -q gnohup
        command nohup $argv
    else
        gnohup $argv
    end
end
