{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    # from: set -g default-terminal "screen-256color"
    terminal = "screen-256color";

    # Prefix is Ctrl-a
    prefix = "C-a";

    # vi-style keys
    keyMode = "vi";

    # scrollback history
    historyLimit = 10000;

    # base index for windows
    baseIndex = 1;

    # enable mouse
    mouse = true;

    # Anything that doesn't have a direct option goes here
    extraConfig = ''
      # lower escape time and pane base index
      set -sg escape-time 1
      setw -g pane-base-index 1

      setw -g monitor-activity on
      set -g visual-activity on

      # y and p as in vim
      bind Escape copy-mode
      unbind p
      bind p paste-buffer

      # tmux 2.4 copy-mode-vi keybindings
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      bind-key -T copy-mode-vi 'Space' send -X halfpage-down
      bind-key -T copy-mode-vi 'Bspace' send -X halfpage-up

      # xclip clipboard integration
      bind C-c run "tmux save-buffer - | xclip -i -sel clipboard"
      bind C-v run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"

      # split panes
      bind | split-window -h
      bind _ split-window -v
      unbind '"'
      unbind %

      # vim-style pane movement
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # vim-style window movement
      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      # resize with vim keys
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # mouse already enabled via option, but harmless to repeat:
      set -g mouse on

      # Middle click to paste from clipboard
      unbind-key MouseDown2Pane
      bind-key -n MouseDown2Pane run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"

      # Yazi passthrough
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      # status bar styling
      set -g status-justify "left"
      set -g status "on"
      set -g status-left-style "none"
      set -g message-command-style "fg=colour254,bg=colour238"
      set -g status-right-style "none"
      set -g pane-active-border-style "fg=colour245"
      set -g status-style "none,bg=colour235"
      set -g message-style "fg=colour254,bg=colour238"
      set -g pane-border-style "fg=colour238"
      set -g status-right-length "100"
      set -g status-left-length "100"
      setw -g window-status-activity-style "none"
      setw -g window-status-separator ""
      setw -g window-status-style "none,fg=colour246,bg=colour235"
      set -g status-left "#[fg=colour235,bg=colour245] #S #[fg=colour245,bg=colour235,nobold,nounderscore,noitalics]"
      set -g status-right "#[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour238] #{pane_title} #[fg=colour245,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour245] #h "
      setw -g window-status-format "#[fg=colour246,bg=colour235] #I #[fg=colour246,bg=colour235] #W "
      setw -g window-status-current-format "#[fg=colour235,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour238] #I #[fg=colour254,bg=colour238] #W #[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]"
    '';
  };
}

