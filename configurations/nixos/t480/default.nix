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

  networking.hostName = "t480";
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
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };


    kernelParams = [
      "i915.enable_dp_mst=1"
    ];


    #### Asus hotkeys / backlight modules
    # These are the standard Asus laptop drivers that handle hotkeys/backlight.
      kernelModules = [
        "thinkpad_acpi"
        "acpi_call"
      ];
      extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1 experimental=1
    '';
  };

  #### CPU microcode (safe + recommended)
  hardware.cpu.intel.updateMicrocode = true;
    # TrackPoint config (this is usually the most annoying part on T-series)
  hardware.trackpoint = {
    enable        = true;      # turn on /sys tweaks :contentReference[oaicite:3]{index=3}
    sensitivity   = 200;       # 128 default, 255 max – tune to taste :contentReference[oaicite:4]{index=4}
    speed         = 200;       # 97 default, 255 max
    emulateWheel  = true;      # middle-button scroll (classic ThinkPad)
  };
    # Optional: dedicated fan curve that’s known to work on a T440 
  # services.thinkfan = {
  #   enable  = true;
  #   sensors = ''
  #     # discovered via: find /sys/devices -type f -name "temp*_input"
  #     hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp3_input
  #     hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
  #     hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input
  #     hwmon /sys/devices/virtual/hwmon/hwmon1/temp1_input
  #   '';
  #   levels = ''
  #     (0,   0,  42)
  #     (1,  40,  47)
  #     (2,  45,  52)
  #     (3,  50,  57)
  #     (4,  55,  62)
  #     (5,  60,  77)
  #     (7,  73,  93)
  #     (127, 85, 32767)
  #   '';
  # };

  #### Optional: brightness helper for Fn keys in dwl/Wayland
  # If you want to bind XF86MonBrightness* to `light` in dwl:
  programs.light.enable = true;

}

