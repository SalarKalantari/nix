# modules/nixos/core/users.nix
{ config, lib, pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      # Auto-start dwl + dwlb on tty1
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
        exec dwl -s "dwlb -ipc -font 'monospace:size=11'"
      fi
    '';
  };


  users.users = {
    salar = {
      isNormalUser = true;
      home = "/home/salar";
      createHome = true;
      description = "Salar Kalantari";
      extraGroups = [
        "wheel" "audio" "video" "networkmanager" "input" "seat"
      ];
      shell = pkgs.zsh;
    };
  };

}

