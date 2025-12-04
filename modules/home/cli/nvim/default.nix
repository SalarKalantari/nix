# nix/modules/home/cli/nvim/default.nix
{ config, lib, ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      # "Global" editor tweaks – rough LazyVim-ish defaults
      viAlias = true;
      vimAlias = true;

      options = {
        number = true;
        relativenumber = true;
        cursorline = true;
        scrolloff = 5;
        wrap = false;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        termguicolors = true;
        signcolumn = "yes";
        updatetime = 250;
        timeoutlen = 400;
      };

      # Statusline (lualine)
      statusline.lualine.enable = true;

      # File tree (neo-tree)
      filetree.neo-tree.enable = true;

      # Telescope (fuzzy finder)
      telescope.enable = true;

      # Visual niceties
      visuals.rainbow-delimiters.enable = true;

      # Theme – LazyVim-ish
      theme = {
        enable = true;
        name = "tokyonight"; # adjust if nvf expects "tokyonight-nvim"
        style = "night";
      };

      # Completion
      autocomplete.nvim-cmp.enable = true;

      # LSP block (pure vim.lsp.config world)
      lsp = {
        enable = true;

        servers = {
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          rust_analyzer.enable = true;
          bashls.enable = true;
        };
      };

      # Language extras (treesitter, formatters, etc.)
      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableTreesitter = true;

        nix = {
          enable = true;
          format.type = "nixfmt";
        };

        lua.enable = true;
        python.enable = true;
        bash.enable = true;
        rust.enable = true;
      };
    };
  };
}

