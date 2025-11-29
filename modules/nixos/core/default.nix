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
    ./dev-tools.nix
    ./home-manager.nix
  ];
}

