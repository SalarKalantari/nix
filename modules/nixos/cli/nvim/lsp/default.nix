# modules/home/cli/nvim/lsp.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    # ----- LSP / Treesitter / formatting: all Nix-managed, no mason.nvim -----

    # nvf wires LSP + TS + format through these modules, using Nixpkgs packages
    # (no mason.nvim / dynamic binaries)
    lsp.enable = true;

    # High-level language toggles
    languages = {
      # NOTE: do NOT set enableLSP here on nvf v0.8; it’s deprecated.
      enableTreesitter = true;
      enableFormat = true;
      enableDAP = true;

      nix = {
        enable = true;
        format = {
          enable = true;
          type = [ "alejandra" "nixfmt" ];
        };
      };

      lua = {
        enable = true;
        lsp.enable = true;
      };

      python = {
        enable = true;
        lsp.enable = true;
      };

      bash = {
        enable = true;
        lsp.enable = true;
      };

      rust = {
        enable = true;
        lsp.enable = true;
        dap.enable = true;
      };

      clang = {
        enable = true;
        lsp.enable = true;
      };

      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };

      zig = {
        enable = true;
        lsp.enable = true;
        dap.enable = true;
        treesitter.enable = true;
      };
    };

    # Treesitter core behaviour
    treesitter = {
      enable = true;
      context.enable = true;
      fold = true;
      autotagHtml.enable = true;
    };
  };
}

