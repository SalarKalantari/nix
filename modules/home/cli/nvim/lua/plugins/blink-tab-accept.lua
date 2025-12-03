return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Keymaps: start from scratch so <CR> doesn't accept
    opts.keymap = {
      preset = "none",
      ["<Tab>"] = {
        -- Forward through snippet, then accept completion if menu visible,
        -- then fall back to insert a literal tab / indent
        "snippet_forward",
        "accept",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      -- Make Enter just do the editor's default (newline, MiniPairs, etc.)
      ["<CR>"] = { "fallback" },
    }

    -- Disable blink auto brackets so MiniPairs (or your own) controls it
    opts.completion = opts.completion or {}
    opts.completion.accept = opts.completion.accept or {}
    opts.completion.accept.auto_brackets = { enabled = false }

    return opts
  end,
}
