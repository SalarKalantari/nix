{ ... }:

{
  programs.nvf.settings.vim.luaConfigPost = ''
    -- helper to create augroups with a prefix so we don't collide
    local function nvf_augroup(name)
      return vim.api.nvim_create_augroup("nvf_" .. name, { clear = true })
    end

    ---------------------------------------------------------------------------
    -- 1. Auto-create parent directories on :w  (LazyVim-style E212 fix)
    ---------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = nvf_augroup("auto_create_dir"),
      callback = function(event)
        -- skip weird URIs (netrw, oil, etc.)
        if event.match:match("^%w%w+://") then
          return
        end

        local uv = vim.uv or vim.loop
        local file = (uv and uv.fs_realpath(event.match)) or event.match

        -- directory part of the file path
        local dir = vim.fn.fnamemodify(file, ":p:h")
        if dir == "" then
          return
        end

        -- "p" = create parents as needed
        vim.fn.mkdir(dir, "p")
      end,
    })

    ---------------------------------------------------------------------------
    -- 2. Restore last cursor position on reopen (LazyVim-style)
    ---------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("BufReadPost", {
      group = nvf_augroup("last_cursor_position"),
      callback = function(event)
        -- don't restore in commit / rebase messages
        local ft = vim.bo[event.buf].filetype or ""
        if ft:match("commit") or ft:match("rebase") then
          return
        end

        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        local lnum, col = mark[1], mark[2]
        local last_line = vim.api.nvim_buf_line_count(event.buf)

        if lnum > 0 and lnum <= last_line then
          pcall(vim.api.nvim_win_set_cursor, 0, { lnum, col })
        end
      end,
    })
  '';
}

