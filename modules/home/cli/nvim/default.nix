# nix/modules/home/cli/nvim/default.nix
{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.nvf = {
    enable = true;

    # All nvf options live under `settings.vim`
    settings.vim = {
      # Make `vim` and `vi` run nvf-Neovim
      viAlias = true;
      vimAlias = true;

      # ----- Core behaviour / "feel" (similar to LazyVim's options.lua) -----
      globals = {
        mapleader = " ";
        maplocalleader = ",";
      };

      # Short-hand for number + relativenumber
      lineNumberMode = "relNumber";

      # Use system clipboard like LazyVim
      clipboard = {
        enable = true;

        # Wayland + wl-clipboard (what you’re using with dwl)
        providers.wl-copy.enable = true;

        # Same behaviour as `set clipboard=unnamedplus`
        registers = "unnamedplus";
      };

      options = {
        number = true;
        relativenumber = true;
        cursorline = true;
        signcolumn = "yes";

        termguicolors = true;
        mouse = "a";

        ignorecase = true;
        smartcase = true;

        splitbelow = true;
        splitright = true;

        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        softtabstop = 2;

        scrolloff = 5;
        sidescrolloff = 5;

        wrap = false;

        # Make cursorline highlight the whole screen line
        cursorlineopt = "both";

        updatetime = 200;
        timeoutlen = 300;
      };

      # Persistent undo
      undoFile.enable = true;

      # ----- Look & UI (theme, statusline, icons, indent guides…) -----
      theme = {
        enable = true;
        # LazyVim defaults to TokyoNight / Catppuccin; pick TokyoNight here
        name = "tokyonight";
        style = "moon";
      };

      statusline.lualine = {
        enable = true;
        theme = "auto";
      };

      visuals = {
        # icons everywhere (neo-tree, telescope, etc.)
        nvim-web-devicons.enable = true;

        # Rainbow parens
        rainbow-delimiters.enable = true;

        # Indent guides, like LazyVim’s indent-blankline setup
        indent-blankline = {
          enable = true;
          # setupOpts = {
          #   show_trailing_blankline_indent = false;
          #   show_current_context = true;
          # };
        };

        # Use the new cursorline module name
        nvim-cursorline.enable = true;

      };

      # which-key style popup for <leader> mappings
      binds.whichKey = {
        enable = true;
        setupOpts = {
          preset = "modern";
          notify = true;
          win = {
            border = "rounded";
          };
        };
      };

      # ----- Files / navigation: neo-tree + telescope -----
      filetree.neo-tree = {
        enable = true;
        # Use plugin defaults; you can extend via setupOpts later
        setupOpts = { };
      };

      telescope.enable = true;

      # A few LazyVim-style leader keymaps
      keymaps = [
        # neo-tree
        {
          key = "<leader>e";
          mode = [ "n" ];
          action = "<CMD>Neotree toggle<CR>";
          desc = "File tree (neo-tree)";
        }

        # telescope
        {
          key = "<leader>ff";
          mode = [ "n" ];
          action = "<CMD>Telescope find_files<CR>";
          desc = "Find files";
        }
        {
          key = "<leader>fg";
          mode = [ "n" ];
          action = "<CMD>Telescope live_grep<CR>";
          desc = "Grep (live)";
        }
        {
          key = "<leader>fb";
          mode = [ "n" ];
          action = "<CMD>Telescope buffers<CR>";
          desc = "Buffers";
        }
        {
          key = "<leader>fh";
          mode = [ "n" ];
          action = "<CMD>Telescope help_tags<CR>";
          desc = "Help tags";
        }

        # basic quality-of-life
        {
          key = "g=";
          mode = [ "n" ];
          action = "m'g g V G=''"; # reindent whole file
          desc = "Reindent buffer";
        }
      ];

      # ----- Editing UX: cmp, snippets, autopairs, comments, surround... -----
      autocomplete.nvim-cmp.enable = true; # core completion
      snippets.luasnip.enable = true; # snippet engine used by nvf’s cmp setup

      autopairs.nvim-autopairs.enable = true; # auto close brackets/quotes
      comments.comment-nvim.enable = true; # gcc / gc motions for comments (Comment.nvim)

      # Surround (change/add/delete surroundings)
      mini.surround.enable = true; # mini.surround wrapper module

      # Motion / hopping around (LazyVim uses flash.nvim; hop is close)
      utility.motion.hop.enable = true;

      # Integrated terminal like LazyVim’s terminal mappings
      terminal.toggleterm.enable = true;

      # ----- Git integration (gitsigns in the gutter) -----
      git.gitsigns.enable = true; # signs + hunk actions like LazyVim’s gitsigns setup

      # ----- LSP / Treesitter / formatting: all Nix-managed, no mason.nvim -----
      # nvf wires LSP + TS + format through these modules, using Nixpkgs packages,
      # not dynamic binaries from mason
      lsp = {
        enable = true;
        formatOnSave = true;
        # LSP-kind icons in completion/menu similar to LazyVim
        lspkind.enable = true;
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableDAP = true;

        nix = {
          enable = true;
          format = {
            enable = true;
            type = "nixfmt";
          };
          lsp.enable = true;
          extraDiagnostics = {
            enable = true;
            types = [
              "statix"
              "deadnix"
            ];
          };
        };

        lua = {
          enable = true;
          lsp.enable = true;
        };

        python = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
        };

        bash = {
          enable = true;
          lsp.enable = true;
        };

        rust = {
          enable = true;
          lsp.enable = true;
          dap.enable = true;
        };
      };
    };
  };
}
