# modules/darwin/core/default.nix
{ ... }:
{
  imports = [
    ./home-manager.nix
    ./lix.nix
    ./nix.nix
    ./resolve.nix
    # later: ./nix.nix ./users.nix ./locale.nix ...
  ];
}

