{ ... }:
{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "One Dark";
      };
      base_keymap = "VSCode";
      icon_theme = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Zed (Default)";
      };
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 15;
    };
    extensions = [
      "nix"
      "python-lsp"
      "zig"
      "lua"
    ];
    installRemoteServer = true;
  };
}
