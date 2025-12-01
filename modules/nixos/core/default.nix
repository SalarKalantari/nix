{ ... }:
{
  imports = [
    ./lix.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./security.nix
    ./nix.nix
    ./overlays.nix
    ./tools.nix
    ./home-manager.nix
    ./revision.nix
  ];
}

