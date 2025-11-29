{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      # tweak this list however you like
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      # add Persian fonts etc. here
      vazir-fonts
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif     = [ "Noto Serif" ];
      };
    };
  };
}

