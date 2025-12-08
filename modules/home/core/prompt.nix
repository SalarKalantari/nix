# modules/home/core/prompt.nix
{ ... }:
{
  programs.starship = {
    enable = false;
    enableZshIntegration = true;
  };
}

