function cat
    if test (count $argv) -eq 1
        switch (string lower -- "$argv[1]")
            case '--version'
                bat $argv
            case '*.gpx'
                bat -p --paging=never $argv
	    case '*.md'
                mdcat $argv
            case '*'
                if identify $argv > /dev/null 2>&1
                  icat $argv
                else
                  bat -p --paging=never $argv
                end
        end
    else
        bat -p --paging=never $argv
    end
end
