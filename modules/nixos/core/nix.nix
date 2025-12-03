# modules/nixos/core/nix.nix
{ config, lib, pkgs, ... }:

{
  nix = {
      # package = pkgs.lix;
      settings = {
          experimental-features = [ "nix-command" "flakes" ];
          trusted-users = [ "root" "salar" ];
          auto-optimise-store = true;

          # Optional but very nice for debugging & GC behavior:
          keep-outputs = true;
          keep-derivations = true;
        };


      gc = {
          automatic = false;
          dates = "weekly";
          options = "--delete-older-than 30d";
        };

    };

  nixpkgs.config = {
      allowUnfree = true;
    };

  # If you want per-host extra settings, you can still override or extend.
}

