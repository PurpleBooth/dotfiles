function z
    set -l tgt_dir (fasd -dlR | fzf-tmux --height 25% --reverse)
    if [ (echo $tgt_dir) ]
        cd $tgt_dir
    end
end
