# modules/nixos/core/home-manager.nix
{ flake, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    # Home Manager as a NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  # Play nicely with the main system pkgs
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.salar = import ../../../configurations/home;
  };

}

