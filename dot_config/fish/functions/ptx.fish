function ptx
    if ! type -q gptx
        command ptx $argv
    else
        gptx $argv
    end
end
