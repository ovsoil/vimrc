return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Toggle line comment" },
      { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
      { "gbc", mode = "n", desc = "Toggle block comment" },
      { "gb", mode = { "n", "v" }, desc = "Toggle block comment" },
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
