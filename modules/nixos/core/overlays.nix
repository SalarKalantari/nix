# modules/nixos/core/overlays.nix
{ ... }:
{
  nixpkgs.overlays = [
    (import ../../../overlays/dwl.nix)
  ];
}

