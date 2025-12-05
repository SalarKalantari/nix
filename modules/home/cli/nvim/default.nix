# modules/home/cli/nvim/default.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./behavior         
    ./lsp
    ./core.nix
    ./ui.nix
    ./navigation.nix
    ./editing.nix
    ./assistant
  ];

  programs.nvf.enable = false;
}

