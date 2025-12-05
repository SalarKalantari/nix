{ lib, pkgs, ... }:

{
  programs.nvf.settings.vim.assistant.copilot = {
    # main switch
    enable = true;

    # integrate with nvim-cmp (your LazyVim-like setup)
    cmp.enable = true;

    # optional: change NodeJS runtime used by Copilot.lua
    # (nvf already chooses a sane default; only touch this if you know you need to)
    # node = pkgs.nodejs_20;
  };
}

