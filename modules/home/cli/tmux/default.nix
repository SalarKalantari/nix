{ config, pkgs, ... }:

{
  # You now fully own ~/.config/tmux/tmux.conf
  home.file."tmux" = {
    target = ".config/tmux/tmux.conf";
    source = ./tmux.conf;
  };
}

