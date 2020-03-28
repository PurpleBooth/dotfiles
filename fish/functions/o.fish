function o
    set -l tgt_dir (fasd -alR | fzf-tmux --height 25% --reverse)
    if [ (echo $tgt_dir) ]
        open $tgt_dir
    end
end
