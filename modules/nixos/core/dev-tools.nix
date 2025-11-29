{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        vim
        wget
        tmux
        neovim
        yazi
        btop
        nix-prefetch-git
      ];
  }
