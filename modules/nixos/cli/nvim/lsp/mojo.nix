# modules/home/cli/nvim/lsp/mojo.nix
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.nvf;
in {
  config = lib.mkIf cfg.enable {
    programs.nvf.settings.vim.lsp.servers.mojo = {
      enable = true;
      cmd = [ "mojo-lsp-server" ];  # must be on $PATH
      filetypes = [ "mojo" ];
    };
  };
}

