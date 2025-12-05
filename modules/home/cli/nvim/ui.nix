# modules/home/cli/nvim/ui.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    # ----- Look & UI (theme, statusline, dashboard, bufferline, minimap…) -----

    # LazyVim’s default theme is TokyoNight or Catppuccin; we go with TokyoNight.
    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
    };

    # Lualine statusline with theme integration
    statusline.lualine = {
      enable = true;
      theme = "tokyonight";
    };

    # Startup dashboard (alpha.nvim)
    dashboard.alpha.enable = true;

    # Minimap on the right
    minimap.codewindow.enable = true;

    # Bufferline tabline, showing buffers like LazyVim
    tabline.nvimBufferline = {
      enable = true;
      setupOpts.options = {
        mode = "buffers"; # "buffers" or "tabs"
        close_icon = "";
        color_icons = true;
        indicator.style = "icon"; # "icon", "underline", "none"
      };
    };

    # ----- Rich UI layer: breadcrumbs, modes, visuals, utilities -----

    ui = {
      # LSP-integrated breadcrumbs (navic) and navbuddy popup
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;

        # Show breadcrumbs in winbar via lualine (LazyVim-style)
        lualine.winbar.enable = true;
      };

      # modes.nvim: big mode indicator, subtle background highlight
      modes-nvim = {
        enable = true;
        setupOpts = {
          line_opacity.visual = 0.15;
          setCursorline = true;
        };
      };
    };

    visuals = {
      # Icons everywhere (neo-tree, telescope, etc.)
      nvim-web-devicons.enable = true;

      # Rainbow parens
      rainbow-delimiters.enable = true;

      # Indent guides, like LazyVim’s indent-blankline setup
      indent-blankline.enable = true;

      # LSP progress / notifications in the corner
      fidget-nvim.enable = true;

      # Highlight recent changes on undo
      highlight-undo.enable = true;

      # Cursorline with word highlight
      nvim-cursorline = {
        enable = true;
        setupOpts = {
          cursorword.enable = true;
          cursorline.enable = false;
        };
      };

      # Scrollbar with diagnostics
      nvim-scrollbar.enable = true;
    };

    # Small helper plugin that feels very “LazyVim”
    utility.multicursors.enable = true;
  };
}

