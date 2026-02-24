-- ============================================================================
-- Maintainer: ovsoil
--       hxyumail@gmail.com
--       www.ovsoil.cn
-- Migrated to native Neovim Lua config
-- ============================================================================

-- Leader must be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Gracefully handle missing treesitter parsers (built-in ftplugins call
-- vim.treesitter.start() which errors before nvim-treesitter installs parsers)
local _ts_start = vim.treesitter.start
vim.treesitter.start = function(bufnr, lang)
  pcall(_ts_start, bufnr, lang)
end

-- Load core config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = false },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = false },
  change_detection = { notify = false },
  rocks = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchparen", "netrwPlugin",
        "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})
