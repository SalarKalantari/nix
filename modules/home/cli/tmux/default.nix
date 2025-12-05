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

    # Automatically spawn a session if trying to attach and none are running
    newSession = true;

    # Time in milliseconds for which tmux waits after an escape is input
    escapeTime = 0;
    
    # Run the sensible plugin at the top of the configuration
    sensibleOnTop = true;


    # List of tmux plugins to be included at the end of your tmux configuration
     plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        # extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        # extraConfig = ''
        #   set -g @continuum-restore 'on'
        #   set -g @continuum-save-interval '60' # minutes
        # '';
      }
      {
        plugin = tmuxPlugins.tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_show_datetime 0
          set -g @tokyo-night-tmux_show_hostname 1
          set -g @tokyo-night-tmux_show_path 1
          set -g @tokyo-night-tmux_path_format relative # 'relative' or 'full'
          set -g @tokyo-night-tmux_theme storm
        '';
      }
    ];





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

      # Middle click to paste from clipboard
      unbind-key MouseDown2Pane
      bind-key -n MouseDown2Pane run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"

      # Yazi passthrough
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
    '';
  };
}


