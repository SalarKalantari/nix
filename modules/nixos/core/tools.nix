{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        clang
	tree-sitter
	nodejs
	fzf
	zoxide
        git
	direnv
        wget
        curl
        tmux
        yazi
        btop
	eza
	htop
	bat
	fd
	jq
	ripgrep
        nix-prefetch-git
	nix-output-monitor
	nvd
	lazygit
	pixi
      ];
  }
