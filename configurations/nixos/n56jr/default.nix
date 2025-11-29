{ flake, pkgs, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    ./hardware-configuration.nix
    # ../../../modules/nixos
    self.nixosModules.default

  ];

  networking.hostName = "n56jr";
  system.stateVersion = "25.05";

  # nixpkgs.hostPlatform = "x86_64-linux";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #### Asus hotkeys / backlight modules
    # These are the standard Asus laptop drivers that handle hotkeys/backlight.
      kernelModules = [
        "asus_wmi"
        "hid_asus"
        "asus_nb_wmi"  # only if present in your kernel
      ];
  };


}

