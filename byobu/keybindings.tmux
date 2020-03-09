set -g prefix C-b
unbind-key -n C-a
unbind-key -n M-Right
unbind-key -n M-Left

unbind-key -T copy-mode-vi MouseDragEnd1Pane
unbind-key -T copy-mode MouseDragEnd1Pane
bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
bind -T copy-mode Enter send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
