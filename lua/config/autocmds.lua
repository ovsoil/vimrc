local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Restore cursor position
autocmd("BufReadPost", {
  group = augroup("restore_cursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 1 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Disable paste mode when leaving insert
autocmd("InsertLeave", {
  group = augroup("no_paste", { clear = true }),
  command = "set nopaste",
})

-- JSON comment highlighting
autocmd("FileType", {
  group = augroup("json_comment", { clear = true }),
  pattern = "json",
  command = [[syntax match Comment +\/\/.\+$+]],
})

-- Filetype-specific indent
autocmd("FileType", {
  group = augroup("filetype_indent", { clear = true }),
  pattern = { "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
  end,
})

autocmd("FileType", {
  group = augroup("filetype_indent_2", { clear = true }),
  pattern = { "vim", "json", "yaml", "javascript", "html", "xhtml", "xml", "css", "vue", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- .conf files as json
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("conf_filetype", { clear = true }),
  pattern = "*.conf",
  command = "setf json",
})

-- Auto delete trailing whitespace on save for specific filetypes
autocmd("BufWritePre", {
  group = augroup("auto_trim", { clear = true }),
  pattern = { "*.py", "*.coffee" },
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//ge]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- Quickfix always at bottom
autocmd("FileType", {
  group = augroup("quickfix_bottom", { clear = true }),
  pattern = "qf",
  callback = function()
    vim.opt_local.winfixwidth = true
  end,
})
autocmd("BufWinEnter", {
  group = augroup("quickfix_position", { clear = true }),
  callback = function()
    if vim.bo.buftype == "quickfix" then
      vim.cmd("wincmd J")
    end
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("yank_highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
