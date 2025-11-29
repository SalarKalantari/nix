# modules/nixos/core/users.nix
{ config, lib, pkgs, ... }:
{

  programs.zsh = {
    enable = true;
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

