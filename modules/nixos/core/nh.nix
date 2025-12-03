{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption mkOption types;
in {
  # dendritic option “branch”
  options.core.nh = {
    enable = mkEnableOption "NH (Nix Helper) CLI integration";

    flake = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        Flake path for nh (sets NH_FLAKE / NH_OS_FLAKE via programs.nh.flake).
        Point this at your dendritic flake root, e.g. "/home/salar/nix".
      '';
    };

    cleanExtraArgs = mkOption {
      type = types.str;
      default = "--keep-since 7d --keep 5";
      description = "Arguments passed to `nh clean`.";
    };
  };

  config = mkIf config.core.nh.enable {
    programs.nh = {
      enable = true;
      # This sets NH_FLAKE / NH_OS_FLAKE for you 
      flake = config.core.nh.flake;

      clean = {
        enable = true;           # periodic `nh clean all` service 
        extraArgs = config.core.nh.cleanExtraArgs;
      };
    };
  };
}

