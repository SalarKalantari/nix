# modules/darwin/core/nix.nix
{ config, lib, pkgs, ... }:

{
  nix = {
      package = pkgs.lix;
      settings = {
          experimental-features = [ "nix-command" "flakes" ];
          trusted-users = [ "root" "salar" ];
          auto-optimise-store = true;

          # Optional but very nice for debugging & GC behavior:
          keep-outputs = true;
          keep-derivations = true;
        };


      gc = {
          automatic = true;
          interval = {
            # weekly, Sunday 03:15 (example)
            Weekday = 7;
            Hour    = 3;
            Minute  = 15;
            };
          options = "--delete-older-than 30d";
        };

    };

  nixpkgs.config = {
      allowUnfree = true;
    };

  # If you want per-host extra settings, you can still override or extend.
}

