{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        clang
	fzf
	zoxide
        git
	direnv
        vim
        wget
        curl
        tmux
        neovim
        yazi
        btop
	eza
	htop
	bat
	fd
	jq
	ripgrep
        nix-prefetch-git
      ];
  }
