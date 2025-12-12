{ config, lib, pkgs, ... }:

{
  # --- Shell / login configuration ---
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      # Auto-start dwl + dwlb on tty1
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
        exec dwl -s "dwlb -ipc -font 'monospace:size=12'"
      fi
    '';
  };

  # --- Users & groups ---
  users = {
    # Primary group for user "salar"
    groups.salar = {
      # Optional: pin a GID if you like
      # gid = 100;
    };

    users.salar = {
      isNormalUser = true;
      # Explicit primary group
      group = "salar";

      home = "/home/salar";
      createHome = true;
      description = "Salar Kalantari";

      extraGroups = [
        "wheel"
        "audio"
        "video"
        "networkmanager"
        "input"
        "seat"
      ];

      shell = pkgs.zsh;
    };
  };
}

