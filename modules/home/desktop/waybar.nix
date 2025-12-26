{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
          "HDMI-A-2"
          "DP-3"
          "DP-4"
        ];
        modules-left = [
          "ext/workspaces"
          "dwl/window"
        ];
        "ext/workspaces" = {
          format = "{icon}";
          ignore-hidden = true;
          on-click = "activate";
          on-click-right = "deactivate";
          sort-by-id = true;
        };
        "dwl/window" =  {
          format = "[{layout}] {title}";
        };
      };
    };
    style = ''
      /* TokyoNight Night-ish palette */
      @define-color bg        #1a1b26;
      @define-color bg2       #16161e;
      @define-color fg        #c0caf5;
      @define-color fg2       #a9b1d6;
      @define-color blue      #7aa2f7;
      @define-color cyan      #7dcfff;
      @define-color green     #9ece6a;
      @define-color yellow    #e0af68;
      @define-color orange    #ff9e64;
      @define-color red       #f7768e;
      @define-color purple    #bb9af7;

      * {
        border: none;
        border-radius: 12px;
        min-height: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12.5px;
      }

      window#waybar {
        background: transparent;
        color: @fg;
      }

      #waybar > box {
        margin: 8px 10px 0 10px;
        padding: 6px 8px;
        background: alpha(@bg, 0.88);
        border: 1px solid alpha(@blue, 0.20);
        box-shadow: 0 10px 30px alpha(#000000, 0.35);
      }

      .modules-left > widget,
      .modules-center > widget,
      .modules-right > widget {
        margin: 0 4px;
      }
    '';
  };
}
