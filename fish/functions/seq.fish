function seq
    if ! type -q gseq
        command seq $argv
    else
        gseq $argv
    end
end
