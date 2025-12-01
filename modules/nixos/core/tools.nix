{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        clang
        git
        vim
        wget
        curl
        tmux
        neovim
        yazi
        btop
        nix-prefetch-git
      ];
  }
