# { config, lib, pkgs, ... }:
# let
#   inherit (config) lib;
#   inherit (lib) file;
#   inherit  (file) mkOutOfStoreSymlink;
# in
# {
#     home.file."nvim" = {
#         target = ".config/nvim";
#         source = mkOutOfStoreSymlink ./nvim;
#       };
#
#     home.file."tmux" = {
#         target = ".config/tmux";
#         source = mkOutOfStoreSymlink ./tmux;
#       };
#
#   }
{ config, lib, pkgs, ... }:

{
  # Neovim: ~/.config/nvim -> /home/salar/nix/modules/home/cli/nvim
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "/home/salar/nix/modules/home/cli/nvim";

  # Tmux: ~/.config/tmux -> /home/salar/nix/modules/home/cli/tmux
  home.file.".config/tmux".source =
    config.lib.file.mkOutOfStoreSymlink "/home/salar/nix/modules/home/cli/tmux";
}

