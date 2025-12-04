{ pkgs, ... }:
{
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      shortcut = "a";
      terminal = "screen-256color";
      baseIndex = 1;
      escapeTime = 0;
      newSession = true;
      historyLimit = 10000;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        resurrect
        continuum
        tokyo-night-tmux
        ];
      extraConfig = ''
        # set -g @tokyo-night-tmux_show_datetime 0
        # set -gset -g @tokyo-night-tmux_show_battery_widget 1

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
        '';
      };
  }
