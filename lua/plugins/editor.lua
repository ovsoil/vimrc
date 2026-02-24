return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Toggle line comment" },
      { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
      { "gbc", mode = "n", desc = "Toggle block comment" },
      { "gb", mode = { "n", "v" }, desc = "Toggle block comment" },
      { "<leader>cc", function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle line comment" },
      { "<leader>cc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "v", desc = "Toggle comment" },
      { "<leader>cb", function() require("Comment.api").toggle.blockwise.current() end, desc = "Toggle block comment" },
      { "<leader>cb", "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", mode = "v", desc = "Toggle block comment" },
      { "<leader>cA", function() require("Comment.api").insert.linewise.eol() end, desc = "Comment at end of line" },
      { "<leader>co", function() require("Comment.api").insert.linewise.below() end, desc = "Comment on line below" },
      { "<leader>cO", function() require("Comment.api").insert.linewise.above() end, desc = "Comment on line above" },
    },
    opts = {
      padding = true,
    },
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
    },
  },

  -- Hop (replaces easymotion)
  {
    "smoka7/hop.nvim",
    version = "*",
    keys = {
      { "<leader><leader>h", function() require("hop").hint_words({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true }) end, desc = "Hop line backward" },
      { "<leader><leader>l", function() require("hop").hint_words({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }) end, desc = "Hop line forward" },
      { "<leader><leader>j", function() require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.AFTER_CURSOR }) end, desc = "Hop line down" },
      { "<leader><leader>k", function() require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR }) end, desc = "Hop line up" },
      { "<leader><leader>w", function() require("hop").hint_words() end, desc = "Hop word" },
      { "<leader><leader>f", function() require("hop").hint_char1() end, desc = "Hop char" },
    },
    opts = {
      case_insensitive = true,
    },
  },

  -- Zoom window toggle
  { "dhruvasagar/vim-zoom", keys = { { "<C-w>m", desc = "Toggle zoom" } } },

  -- Indent text object
  { "michaeljsmith/vim-indent-object", event = "VeryLazy" },

  -- Visual star search
  { "ovsoil/vsearch.vim", event = "VeryLazy" },
}
