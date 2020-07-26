# Shell Name
set --global --export SHELL_NAME "fish"

## Starship
if type --quiet starship
    starship init fish | source
end
