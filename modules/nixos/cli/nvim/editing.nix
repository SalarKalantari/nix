# modules/home/cli/nvim/editing.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
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
  };
}

