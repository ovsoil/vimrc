return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function() return vim.fn.executable("make") == 1 end,
      },
    },
    cmd = "Telescope",
    keys = {
      -- File finding
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fp", "<cmd>Telescope git_files<CR>", desc = "Git files" },
      { "<leader>fx", function() require("telescope.builtin").find_files({ no_ignore = true }) end, desc = "Find files (no ignore)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>fc", function() require("telescope.builtin").oldfiles({ cwd_only = true }) end, desc = "MRU (cwd)" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer lines" },

      -- Search (normal mode)
      { "<leader>ss", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>sa", "<cmd>Telescope grep_string<CR>", desc = "Grep cword" },
      { "<leader>sw", function() require("telescope.builtin").grep_string({ word_match = "-w" }) end, desc = "Grep cword (word boundary)" },

      -- Search (visual mode)
      { "<leader>ss", '"zy<cmd>lua require("telescope.builtin").live_grep({ default_text = vim.fn.getreg("z") })<CR>', mode = "v", desc = "Grep selection (editable)" },
      { "<leader>sa", '"zy<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.getreg("z") })<CR>', mode = "v", desc = "Grep selection" },
      { "<leader>sw", '"zy<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.getreg("z") })<CR>', mode = "v", desc = "Grep selection" },

      -- Quick grep
      { "<C-B>", function() require("telescope.builtin").current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") }) end, desc = "Grep cword in buffer" },
      { "<C-F>", "<cmd>Telescope grep_string<CR>", desc = "Grep cword in project" },
      { "gf", '"zy<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.getreg("z") })<CR>', mode = "v", desc = "Grep visual selection" },

      -- Resume
      { "go", "<cmd>Telescope resume<CR>", desc = "Resume last search" },
      { "<leader>ts", "<cmd>Telescope resume<CR>", desc = "Resume last search" },

      -- Symbols / Quickfix
      { "<leader>st", "<cmd>Telescope treesitter<CR>", desc = "Treesitter symbols" },
      { "<leader>sq", "<cmd>Telescope quickfix<CR>", desc = "Quickfix list" },

      -- History
      { "<leader>sc", "<cmd>Telescope command_history<CR>", desc = "Command history" },
      { "<leader>s/", "<cmd>Telescope search_history<CR>", desc = "Search history" },

      -- Keymaps
      { "<leader><tab>", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },

      -- LSP
      { "<leader>sr", "<cmd>Telescope lsp_references<CR>", desc = "LSP references" },
      { "<leader>sd", "<cmd>Telescope lsp_definitions<CR>", desc = "LSP definitions" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { preview_width = 0.5 },
          },
          sorting_strategy = "ascending",
          prompt_prefix = "> ",
          selection_caret = "» ",
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<Esc>"] = actions.close,
              ["<C-c>"] = actions.close,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
              ["q"] = actions.close,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
          file_ignore_patterns = { "node_modules", ".git/", ".cache" },
          vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case",
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
          },
          live_grep = {
            additional_args = { "--hidden", "--glob", "!.git" },
          },
          buffers = {
            sort_lastused = true,
            mappings = {
              i = { ["<C-d>"] = actions.delete_buffer },
            },
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
    end,
  },
}
