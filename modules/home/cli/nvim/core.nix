# modules/home/cli/nvim/core.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    # Make `vim` and `vi` run nvf-Neovim
    viAlias = true;
    vimAlias = true;

    # ----- Core behaviour / "feel" (LazyVim-style options.lua) -----
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    # Short-hand for number + relativenumber
    lineNumberMode = "relNumber";

    # Use system clipboard (y/p talk to the system clipboard like LazyVim)
    clipboard = {
      enable = true;

      # Wayland + wl-clipboard (for your dwl setup)
      providers.wl-copy.enable = true;

      # Same behaviour as `set clipboard=unnamedplus`
      registers = "unnamedplus";
    };

    # Core editor options tuned close to LazyVim defaults
    options = {
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";

      termguicolors = true;
      mouse = "a";

      ignorecase = true;
      smartcase = true;

      splitbelow = true;
      splitright = true;

      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;

      # Use global statusline; LazyVim sets this
      laststatus = 3;

      # Better display for wrapped lines (if you ever enable wrap)
      breakindent = true;

      # Decrease updatetime for CursorHold
      updatetime = 200;
      timeoutlen = 300;

      # Better cursorline behaviour
      cursorlineopt = "both";
    };

    # Persistent undo like LazyVim
    undoFile.enable = true;

    # Enable basic syntax highlighting (on top of treesitter)
    syntaxHighlighting = true;
  };
}

