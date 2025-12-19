# modules/nixos/hardware/laptop.nix
{ config, lib, pkgs, ... }:
{
  #### CPU & power (you already had some of this)
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC  = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # Optional: battery-saving charge thresholds for ThinkPad batteries
      START_CHARGE_THRESH_BAT0 = 40;   # start charging when <= 40%
      STOP_CHARGE_THRESH_BAT0  = 80;   # stop charging when >= 80%

    };
  };

  # Generic laptop power management (suspend/hibernate helpers etc.)
  powerManagement.enable = true;

  services.upower.enable   = true;      # battery / power info daemon
  services.thermald.enable = true;      # Intel CPU thermal management

  # Will periodically TRIM your SSD (if supported)
  services.fstrim.enable = true;

  #### Input stack (touchpad + Fn keys events)
  # This enables libinput even though X11 is disabled (you run Wayland/dwl).
  services.libinput.enable = true;


  services.hardware.bolt.enable = true;

  #### Tools for brightness / volume keys (used from dwl keybindings)
  environment.systemPackages = with pkgs; [
    brightnessctl   # control /sys/class/backlight/*
    bolt
    # pamixer         # (optional) volume control from the terminal
    # wireplumber
    # xbacklight
  ];
  #### Input devices / Bluetooth / misc ########################################

  # Bluetooth (T440’s Intel BT works fine with this) 
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable   = true;  # if you want a simple tray GUI

  # lid-close behaviour etc. (tweak to taste) 
  services.logind = {
    settings = {
      "Login" = {
        HandleLidSwitch              = "suspend";
        HandleLidSwitchDocked        = "lock";
        HandleLidSwitchExternalPower = "suspend";
      };
    };
  };

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

