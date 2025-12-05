# modules/home/cli/nvim/default.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./behavior         # your existing behavior module
    ./lsp
    ./core.nix
    ./ui.nix
    ./navigation.nix
    ./editing.nix
  ];

  programs.nvf.enable = true;
}

