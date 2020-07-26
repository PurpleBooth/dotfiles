# Colours
set --global --export CLICOLOR 1
set --global --export LS_COLORS (dircolors -c $colorfile | string split ' ')[3]
