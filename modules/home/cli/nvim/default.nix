# nix/modules/home/cli/nvim/default.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./behavior
  ];

  programs.nvf = {
    enable = true;

    # All nvf options live under `settings.vim`
    settings.vim = {
      # Make `vim` and `vi` run nvf-Neovim
      viAlias = true;
      vimAlias = true;

      # ----- Core behaviour / "feel" (LazyVim-style options.lua) -----
      globals = {
        mapleader = " ";
        maplocalleader = ",";
      };

      # Short-hand for number + relativenumber
      lineNumberMode = "relNumber";

      # Use system clipboard (y/p talk to the system clipboard like LazyVim)
      clipboard = {
        enable = true;

        # Wayland + wl-clipboard (for your dwl setup)
        providers.wl-copy.enable = true;

        # Same behaviour as `set clipboard=unnamedplus`
        registers = "unnamedplus";
      };

      # Core editor options tuned close to LazyVim defaults
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
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;

        # Use global statusline; LazyVim sets this
        laststatus = 3;

        # Better display for wrapped lines (if you ever enable wrap)
        breakindent = true;

        # Decrease updatetime for CursorHold
        updatetime = 200;
        timeoutlen = 300;

        # Better cursorline behaviour
        cursorlineopt = "both";
      };

      # Persistent undo like LazyVim
      undoFile.enable = true;

      # Enable basic syntax highlighting (on top of treesitter)
      syntaxHighlighting = true;

      # ----- Look & UI (theme, statusline, dashboard, bufferline, minimap…) -----

      # LazyVim’s default theme is TokyoNight or Catppuccin; we go with TokyoNight.
      theme = {
        enable = true;
        name = "tokyonight";
        style = "moon";
      };

      # Lualine statusline with theme integration
      statusline.lualine = {
        enable = true;
        theme = "tokyonight";
      };

      # Startup dashboard (alpha.nvim)
      dashboard.alpha.enable = true;

      # Minimap on the right
      minimap.codewindow.enable = true;

      # Bufferline tabline, showing buffers like LazyVim
      tabline.nvimBufferline = {
        enable = true;
        setupOpts.options = {
          mode = "buffers"; # "buffers" or "tabs"
          close_icon = "";
          color_icons = true;
          indicator.style = "icon"; # "icon", "underline", "none"
        };
      };

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
        setupOpts.defaults = {
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

      # ----- Editing UX: cmp, snippets, comments, autopairs, git, terminal -----

      # Completion and snippets (cmp + luasnip, like LazyVim)
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      # Comments (gc motions)
      comments.comment-nvim.enable = true;

      # Auto-insert closing brackets/braces etc.
      autopairs.nvim-autopairs.enable = true;

      # Integrated terminal like LazyVim’s terminal mappings
      terminal.toggleterm.enable = true;

      # Git integration (gitsigns in the gutter)
      git.gitsigns.enable = true;

      # ----- Notes / TODOs -----
      notes.todo-comments.enable = true;

      # ----- LSP / Treesitter / formatting: all Nix-managed, no mason.nvim -----

      # nvf wires LSP + TS + format through these modules, using Nixpkgs packages
      # (no mason.nvim / dynamic binaries)
      lsp.enable = true;

      # High-level language toggles
      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableDAP = true;

        nix = {
          enable = true;
          format = {
            enable = true;
            type = ["alejandra" "nixfmt"];
          };
        };

        lua = {
          enable = true;
          lsp.enable = true;
        };

        python = {
          enable = true;
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

        clang = {
          enable = true;
          lsp.enable = true;
        };

        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
      };

      # Treesitter core behaviour
      treesitter = {
        enable = true;
        context.enable = true;
        fold = true;
        autotagHtml.enable = true;
      };

      # ----- Rich UI layer: breadcrumbs, modes, visuals, utilities -----

      ui = {
        # LSP-integrated breadcrumbs (navic) and navbuddy popup
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;

          # Show breadcrumbs in winbar via lualine (LazyVim-style)
          lualine.winbar.enable = true;
        };

        # modes.nvim: big mode indicator, subtle background highlight
        modes-nvim = {
          enable = true;
          setupOpts = {
            line_opacity.visual = 0.15;
            setCursorline = true;
          };
        };
      };

      visuals = {
        # Icons everywhere (neo-tree, telescope, etc.)
        nvim-web-devicons.enable = true;

        # Rainbow parens
        rainbow-delimiters.enable = true;

        # Indent guides, like LazyVim’s indent-blankline setup
        indent-blankline.enable = true;

        # LSP progress / notifications in the corner
        fidget-nvim.enable = true;

        # Highlight recent changes on undo
        highlight-undo.enable = true;

        # Cursorline with word highlight
        nvim-cursorline = {
          enable = true;
          setupOpts = {
            cursorword.enable = true;
            cursorline.enable = false;
          };
        };

        # Scrollbar with diagnostics
        nvim-scrollbar.enable = true;
      };

      # Small helper plugin that feels very “LazyVim”
      utility.multicursors.enable = true;
    };
  };
}
