-- Powerline separator chars (supported by Monaco for Powerline)
local sep_left = "\238\130\176"   -- U+E0B0 
local sep_right = "\238\130\178"  -- U+E0B2 
local sub_left = "\238\130\177"   -- U+E0B1 
local sub_right = "\238\130\179"  -- U+E0B3 

return {
  -- Gruvbox colorscheme (native Lua)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "",
        overrides = {
          SignColumn = { link = "LineNr" },
        },
      })
      vim.cmd.colorscheme("gruvbox")
      vim.cmd([[
        hi! link ShowMarksHLl DiffAdd
        hi! link ShowMarksHLu DiffChange
      ]])
    end,
  },

  -- Statusline (no Nerd Font icons, Powerline separators only)
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          icons_enabled = false,
          section_separators = { left = sep_left, right = sep_right },
          component_separators = { left = sub_left, right = sub_right },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = false },
        exclude = {
          filetypes = { "help", "dashboard", "defx", "Trouble", "lazy", "terminal" },
        },
      })
      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function()
          require("ibl").setup_buffer(0, { enabled = false })
        end,
      })
    end,
  },

  -- Rainbow delimiters (treesitter-based)
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      local rainbow = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow.strategy["global"],
          vim = rainbow.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
      }
    end,
  },
}
