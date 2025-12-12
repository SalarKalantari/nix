{ pkgs, ... }:

{
    imports = [
     ./browsers
    ];

    systemPackages = with pkgs; [
      protonvpn-gui
    ];
  }
