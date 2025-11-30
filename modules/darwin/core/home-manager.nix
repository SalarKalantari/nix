# modules/darwin/core/home-manager.nix
{ flake, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    # Home Manager as a nix-darwin module
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    # Darwin-specific Home Manager entry (see step 3.2)
    users.salar = import ../../../configurations/home;
  };
}

