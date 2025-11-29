{ config, pkgs, ... }: 

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "monospace:size=10";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      scrollback = {
        lines = 5000;
      };
    };
  };


}
