{ flake, pkgs, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    # Machine-specific disk / filesystems
    ./hardware-configuration.nix

    # Your shared dendritic stack: core + hardware + desktop + cli + gui
    self.nixosModules.default

    # Upstream T480 profile (CPU, SSD, throttled, etc.)
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
  ];

  networking.hostName = "n56jr";
  system.stateVersion = "25.05";

  # nixpkgs.hostPlatform = "x86_64-linux";

  core.nh = {
    enable = true;
    flake = "/home/salar/nix";
    cleanExtraArgs = "--keep-since 7d --keep 5";
    };

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
  #### CPU microcode (safe + recommended)
  hardware.cpu.intel.updateMicrocode = true;


  #### Optional: brightness helper for Fn keys in dwl/Wayland
  # If you want to bind XF86MonBrightness* to `light` in dwl:
  programs.light.enable = true;

}

