bind-key -n M-w new-window -c "#{pane_current_path}" \; rename-window "-"
bind-key -n M-i display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n M-o display-panes \; split-window -v -c "#{pane_current_path}"
bind-key -n M-n display-panes \; select-pane -t :.-
bind-key -n M-p display-panes \; select-pane -t :.+
bind-key -n M-h select-pane -L
bind-key -n M-j select-pane -D
bind-key -n M-k select-pane -U
bind-key -n M-l select-pane -R
bind-key -n M-S-n swap-window -t :-1
bind-key -n M-S-p swap-window -t :+1
#bind-key -n S-F11 resize-pane -Z
bind-key -n M-f resize-pane -Z
#bind-key -n M-IC paste-buffer

