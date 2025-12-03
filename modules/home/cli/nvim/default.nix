{ config, pkgs, ... }:
{
  # You now fully own ~/.config/tmux/tmux.conf
  home.file."nvim" = {
    target = ".config/nvim";
    source = builtins.filterSource
    (path: type:
      # !(builtins.match ".*\\.nix$" path != null)
      builtins.baseNameOf path != "default.nix"
      # ignore macOS junk
      && !(builtins.match ".*\\.DS_Store$" path != null)
      # ignore README
      && !(builtins.match ".*/README\\.md$" path != null)
      # ignore swap files
      && !(builtins.match ".*\\.swp$" path != null)
      )
    ../nvim;
    recursive = true;
  };

}
