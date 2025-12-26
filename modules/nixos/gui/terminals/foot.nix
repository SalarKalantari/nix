{ config, pkgs, ... }: 

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "JetBrainsMono Nerd Font:size=12";
        dpi-aware = "no";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      scrollback = {
        lines = 5000;
      };
    };
    theme = "tokyonight-night";
  };


}
