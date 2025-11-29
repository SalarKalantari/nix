# modules/nixos/hardware/laptop.nix
{ config, lib, pkgs, ... }:
{
  #### CPU & power (you already had some of this)
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC  = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };

  services.upower.enable   = true;      # battery / power info daemon
  services.thermald.enable = true;      # Intel CPU thermal management

  # Will periodically TRIM your SSD (if supported)
  # services.fstrim.enable = true;

  #### Input stack (touchpad + Fn keys events)
  # This enables libinput even though X11 is disabled (you run Wayland/dwl).
  services.libinput.enable = true;

  #### Tools for brightness / volume keys (used from dwl keybindings)
  environment.systemPackages = with pkgs; [
    brightnessctl   # control /sys/class/backlight/*
    # pamixer         # (optional) volume control from the terminal
    # wireplumber
    # xbacklight
  ];

  #### Optional ACPI quirks for brightness (only if Fn brightness does nothing)
  # Try these only if Fn+F5/F6 *do not* generate key events at all.
  # Check first with: `libinput debug-events` or `wev`.
  #
  # boot.kernelParams = [
  #   "acpi_backlight=native"
  #   # or one of the classic Asus tricks:
  #   # "acpi_osi=!Windows 2012"
  #   # "acpi_osi=Linux"
  # ];
}

