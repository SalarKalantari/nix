{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    google-chrome
    firefox
    qutebrowser
  ];

  }
