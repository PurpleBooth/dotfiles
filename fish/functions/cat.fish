function cat
    if test (count $argv) -eq 1 && string match --ignore-case --quiet "*.md" "$argv[1]"
        mdcat $argv[1]
    else
        bat -p --paging=never $argv
    end
end
