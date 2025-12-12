{ pkgs, lib, config, ... }:

{
  services.xserver.enable = false;
  programs.xwayland.enable = false;

  services.seatd.enable = true;
  hardware.graphics.enable= true;

  # Explicit, even though already in hardware/laptop.nix:
  services.libinput.enable = true;

  # Portals for Wayland apps (screen share, file dialogs, etc.)
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    # Keep gtk only for file dialogs; everything else uses wlr
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    config.common = {
      default = [ "wlr" "gtk" ];

      # but for these, we *really* want wlr (Wayland-native screenshare)
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
    };
  };



  environment.systemPackages = with pkgs; [
    libinput
    dwl
    dwlb
    wl-clipboard
    playerctl
    grim
    slurp
    foot
    wmenu
    waylock
    wayidle
  ];
}

