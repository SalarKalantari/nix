{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig =  ''
      local wezterm = require("wezterm")
      local act = wezterm.action

      local config = {}
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      -- Font
      config.font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Regular" })
      config.font_size = 12.0

      -- Colour scheme
      config.color_scheme = "Tokyo Night"

      -- Remove close / minimize / fullscreen buttons
      -- config.window_decorations = "RESIZE"
      -- or: "RESIZE | TITLE"

      -- Allow moving the window by dragging anywhere on the tab bar
      config.enable_tab_bar = true
      config.use_fancy_tab_bar = true

      -- (Optional) Hide the tab bar if only one tab, but keep move-area
      config.hide_tab_bar_if_only_one_tab = true

      -- Allow apps (like Vim) to change the cursor shape
      config.enable_csi_u_key_encoding = true

      return config
    '';
  };
}
