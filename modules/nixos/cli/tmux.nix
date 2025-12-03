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
      };
  }
