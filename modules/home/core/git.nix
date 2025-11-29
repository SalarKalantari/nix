# modules/home/core/git.nix
{ ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Salar Kalantari";
      email = "salar.kalantari@gmail.com";
    };
  };
}

