{ ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withRuby = true;
    withNodeJs = true;
    defaultEditor = true;
  };
}
