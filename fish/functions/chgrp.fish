function chgrp
    if ! type -q gchgrp
        command chgrp $argv
    else
        gchgrp $argv
    end
end
