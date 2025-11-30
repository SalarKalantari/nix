# modules/home/core/shell.nix
{ pkgs, lib, ... }:
let 
  inherit (lib) mkIf;
in
{
  programs.bash.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    history = {
      save = 10000;
      size = 10000;
    };

    # Optional but nice: start in vi mode by default
    # (this is separate from your manual `bindkey -v`, but they work together)
    defaultKeymap = "viins";

    # Your custom vi-mode + cursor-shape config
    initContent = ''
      # --- Use vi keybindings in zsh ---
      bindkey -v          # enables vi mode (viins / vicmd)
      # Make Backspace work in vi insert mode (cover both common codes)
      bindkey -M viins '^?' backward-delete-char   # DEL (what most terminals send)
      bindkey -M viins '^H' backward-delete-char   # Ctrl-H style backspace

      # Optional: make Delete (fn+Backspace on Mac) delete forward in insert mode
      bindkey -M viins '^[[3~' delete-char

      # --- Cursor shapes ---
      #  \e[2 q  => block cursor   (normal mode)
      #  \e[6 q  => bar cursor     (insert mode)

      function zle-keymap-select {
        case $KEYMAP in
          vicmd)      printf '\e[2 q' ;;      # NORMAL mode -> block
          viins|main) printf '\e[6 q' ;;      # INSERT mode -> bar
        esac
        zle reset-prompt
      }

      function zle-line-init {
        zle -K viins          # start in insert mode
        printf '\e[6 q'       # bar cursor at startup
      }

      function zle-line-finish {
        # When a command is accepted, use block cursor (like normal mode)
        printf '\e[2 q'
      }

      zle -N zle-keymap-select
      zle -N zle-line-init
      zle -N zle-line-finish

      # Optional: make vi-mode feel snappier
      export KEYTIMEOUT=1
    '';

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      vim = "nvim";
    };

  };

  programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };
    
  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };


  home.sessionVariables = mkIf pkgs.stdenv.isLinux {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";

    # Tell everything "we are on Wayland"
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";     # Firefox
    NIXOS_OZONE_WL = "1";         # Chromium / Chrome / Brave / Electron
    QT_QPA_PLATFORM = "wayland";  # Qt apps
    SDL_VIDEODRIVER = "wayland";  # SDL apps (games, etc)
    CLUTTER_BACKEND = "wayland";  # GNOME-ish stuff
  };

  home.packages = with pkgs; [
    eza
    htop
    bat
    fd
    ripgrep
  ];
}

