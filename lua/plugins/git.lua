return {
  -- Fugitive (git commands, :Ggrep for project-wide replace)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Ggrep", "Gdiffsplit", "Gread", "Gwrite", "Glog", "GMove", "GDelete", "GBrowse" },
    event = "VeryLazy",
  },

  -- Gitsigns (replaces vim-signify)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = false,
      attach_to_untracked = false,
      max_file_length = 5000,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, "Next hunk")
        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, "Prev hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
      end,
    },
  },

  -- Git blame (inline, disabled by default — toggle with <leader>tb)
  {
    "APZelos/blamer.nvim",
    cmd = "BlamerToggle",
    keys = {
      { "<leader>tb", "<cmd>BlamerToggle<CR>", desc = "Toggle git blame" },
    },
    config = function()
      vim.g.blamer_enabled = 0
      vim.g.blamer_delay = 500
      vim.g.blamer_show_in_visual_modes = 0
    end,
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
      { "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
    },
    opts = {
      diff_binaries = false,
      enhanced_diff_hl = false,
      use_icons = true,
      icons = {
        folder_closed = "▸",
        folder_open = "▾",
      },
      signs = {
        fold_closed = "▸",
        fold_open = "▾",
      },
      file_panel = {
        listing_style = "tree",
        win_config = {
          position = "left",
          width = 35,
        },
      },
      file_history_panel = {
        win_config = {
          position = "bottom",
          height = 16,
        },
        log_options = {
          git = {
            single_file = { max_count = 256 },
            multi_file = { max_count = 128 },
          },
        },
      },
      keymaps = {
        view = {
          { "n", "<leader>e", "<cmd>DiffviewFocusFiles<CR>", { desc = "Focus files" } },
          { "n", "<leader>td", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle files panel" } },
        },
        file_panel = {
          { "n", "<leader>e", "<cmd>DiffviewFocusFiles<CR>", { desc = "Focus files" } },
          { "n", "<leader>td", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle files panel" } },
        },
      },
    },
  },
}
