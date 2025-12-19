{ pkgs, ... }:
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage = {
        preferred_color_scheme = "dark";
        darkmode.enabled = true;
      };
    };
    # package = pkgs.qutebrowser.override { enableWideVine = true; };
  };
}
