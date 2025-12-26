{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
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
        modules-center = [
          "clock"
        ];

        modules-right = [
          "network#ip"
          "pulseaudio"
          "disk"
          "memory"
          "cpu"
          "temperature"
          "battery#bat0"
          "battery#bat1"
        ];

        "temperature" = {
          # // Option A (usually easiest): pick the right thermal zone
          "thermal-zone" = 0;

          # // Option B (more explicit): uncomment and set a real path
          # // "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";

          "interval" = 5;
          "critical-threshold" = 85;
          "format" = " {temperatureC}°C";
          "format-critical" = " {temperatureC}°C";
        };

        "cpu" = {
          "interval" = 2;
          "format" = "󰍛 {usage}%";
        };

        "memory" = {
          "interval" = 2;
          "format" = "󰘚 {used:0.1f}G/{total:0.0f}G ({percentage}%)";
        };

        "disk" = {
          "interval" = 30;
          "path" = "/";
          "format" = "󰋊 {free}";
        };

        "network#ip" = {
          "family" = "ipv4";
          "format-wifi" = " {ipaddr}";
          "format-ethernet" = "󰈀 {ipaddr}";
          "format-disconnected" = " down";
          "tooltip-format" = "{ifname}\n{ipaddr}/{cidr}";
        };

        "network#speed" = {
          "interval" = 1;
          "format-wifi" = "↑ {bandwidthUpBits:>7} ↓ {bandwidthDownBits:>7}";
          "format-ethernet" = "↑ {bandwidthUpBits:>7} ↓ {bandwidthDownBits:>7}";
          "format-disconnected" = "";
        };


        "battery#bat0" = {
          "bat" = "BAT0";
          "interval" = 30;
          "states" = { "warning" = 30; "critical" = 15; };
          "format" = "0 {capacity:>3}%";
          "format-charging" = "0 {capacity:>3}%";
          "format-plugged" = "0 {capacity:>3}%";
        };

        
        "battery#bat1" = {
          "bat" = "BAT1";
          "interval" = 30;
          "states" = { "warning" = 30; "critical" = 15; };
          "format" = "1 {capacity:>3}%";
          "format-charging" = "1 {capacity:>3}%";
          "format-plugged" = "1 {capacity:>3}%";
        };

        
        "pulseaudio" = {
          "format" = " {volume}%";
          "format-muted" = "󰝟 muted";
          "scroll-step" = 5;
        };

        

        "clock" = {
          "format" = "{:%a %d-%b %H:%M}";
          "tooltip-format" = "<big>{:%H %M}</big>\n<tt>{calendar}</tt>";
        };


        "ext/workspaces" = {
          format = "{icon}";
          ignore-hidden = true;
          on-click = "activate";
          on-click-right = "deactivate";
          sort-by-id = true;
        };
        "dwl/window" =  {
          format = "[{layout}] {title}";
          swap-icon-label = false;
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
        border-radius: 10px;
        min-height: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12.5px;
      }

      window#waybar {
        background: transparent;
        color: @fg;
      }

      #waybar > box {
        margin: 2px 6px 0 6px;
        padding: 2px 6px;
        background: alpha(@bg, 0.88);
        border: 1px solid alpha(@blue, 0.20);
        box-shadow: 0 10px 30px alpha(#000000, 0.35);
      }

      .modules-left > widget,
      .modules-center > widget,
      .modules-right > widget {
        margin: 0 4px;
      }

      /* --- Workspaces (ext/workspaces) --- */
      #workspaces {
        padding: 0 2px;
      }

      #workspaces button {
        padding: 0 6px;
        margin: 0 2px;
        color: @fg2;
        background: transparent;

        border-radius: 10px;
        border: 1px solid transparent;

        transition: all 120ms ease-in-out;
      }

      #workspaces button:hover {
        color: @fg;
        background: alpha(@bg2, 0.85);
        border-color: alpha(@blue, 0.25);
      }

      /* Active workspace glow (some modules use .active, some use .focused) */
      #workspaces button.active,
      #workspaces button.focused {
        color: @fg;
        background: alpha(@bg2, 0.92);
        border-color: alpha(@blue, 0.55);

        text-shadow: 0 0 10px alpha(@blue, 0.55);

        box-shadow:
          0 0 0 1px alpha(@blue, 0.35),
          0 0 12px alpha(@blue, 0.35),
          0 0 24px alpha(@blue, 0.18);
      }

      #workspaces button.hidden {
        opacity: 0.35;
      }

      #workspaces button.urgent {
        color: @bg;
        background: alpha(@red, 0.95);
        border-color: alpha(@red, 0.70);
        box-shadow: 0 0 18px alpha(@red, 0.25);
      }

      #clock, #battery, #temperature, #cpu, #memory, #disk, #network, pulseaudio {
        padding: 2px 6px;
        background: alpha(@bg2, 0.75);
        border: 1px solid alpha(@fg, 0.08);
      }

      #clock {
        border-color: alpha(@purple, 0.25);
        color: @fg
      }

      #temperature { border-color: alpha(@orange, 0.25); }
      #temperature.critical { border-color: alpha(@red, 0.55); color: @red; }

      #cpu    { border-color: alpha(@blue, 0.25); }
      #memory { border-color: alpha(@cyan, 0.25); }
      #disk   { border-color: alpha(@green, 0.25); }

      #network { border-color: alpha(@blue, 0.25); min-width: 120px; }

      #pulseaudio { border-color: alpha(@purple, 0.25); }
      #pulseaudio.muted { color: alpha(@fg2, 0.7); }

      #battery.warning  { color: @yellow; }
      #battery.critical { color: @red; }
      #battery.charging { color: @green; }

    '';
  };
}
