# configurations/home/salar/default.nix
{ flake, config, pkgs, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    # Shared Salar home "profile"
    # ../../modules/home
    self.homeModules.default
  ];


  home.username = "salar";
  home.homeDirectory = "/home/salar";
  # Required by Home Manager (separate from system.stateVersion)
  home.stateVersion = "25.05";
}

