# modules/home/cli/nvim/navigation.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    # ----- Files / navigation: neo-tree + telescope -----

    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        filesystem = {
          follow_current_file = {
            enabled = true;
          };
          hijack_netrw_behavior = "open_default";
        };
        window = {
          position = "left"; # or "right" if you prefer
          width = 30;
        };
      };
    };

    telescope = {
      enable = true;
      setupOpts = {
        defaults = {
          # Use ripgrep from Nix instead of relying on PATH
          vimgrep_arguments = [
            "${pkgs.ripgrep}/bin/rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
          ];
        };
      };
    };

    # which-key style popup for <leader> mappings
    binds.whichKey = {
      enable = true;
      setupOpts = {
        preset = "modern"; # "classic", "modern", "helix"
        notify = true;
        win.border = "rounded";
      };
    };

    # A few canonical LazyVim-style leader keymaps
    keymaps = [
      # neo-tree
      {
        key = "<leader>e";
        mode = ["n"];
        action = "<CMD>Neotree toggle reveal<CR>";
        desc = "Explorer Neo-tree (root dir)";
      }
      {
        key = "<leader>E";
        mode = ["n"];
        action = "<CMD>Neotree toggle reveal_force_cwd<CR>";
        desc = "Explorer Neo-tree (cwd)";
      }

      # Telescope
      {
        key = "<leader>ff";
        mode = ["n"];
        action = "<CMD>Telescope find_files<CR>";
        desc = "Find files";
      }
      {
        key = "<leader>fg";
        mode = ["n"];
        action = "<CMD>Telescope live_grep<CR>";
        desc = "Live grep";
      }
      {
        key = "<leader>fb";
        mode = ["n"];
        action = "<CMD>Telescope buffers<CR>";
        desc = "Buffers";
      }
      {
        key = "<leader>fh";
        mode = ["n"];
        action = "<CMD>Telescope help_tags<CR>";
        desc = "Help tags";
      }

      # basic quality-of-life
      {
        key = "g=";
        mode = ["n"];
        action = "m'g g V G=''"; # reindent whole file
        desc = "Reindent buffer";
      }
    ];
  };
}

