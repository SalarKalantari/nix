{ ... }:
{
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = false;
    systemd.enable = true;
  };
}
