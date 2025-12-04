{ ... }:
{
  programs.neovim = {
    enable = false;
    viAlias = true;
    vimAlias = true;
    withRuby = true;
    withNodeJs = true;
    defaultEditor = true;
  };
}
