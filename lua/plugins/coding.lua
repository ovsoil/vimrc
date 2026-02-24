return {
  -- Clang-format
  {
    "rhysd/vim-clang-format",
    dependencies = { "kana/vim-operator-user" },
    ft = { "c", "cpp", "objc" },
    config = function()
      vim.g["clang_format#detect_style_file"] = 1
      vim.g["clang_format#auto_format"] = 0
      vim.g["clang_format#auto_format_on_insert_leave"] = 0
      vim.g["clang_format#auto_formatexpr"] = 0

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "objc" },
        callback = function()
          vim.keymap.set({ "n", "v" }, "<leader>f", "<Plug>(operator-clang-format)",
            { buffer = true, desc = "Clang format" })
        end,
      })
      vim.keymap.set("n", "<leader>tc", "<cmd>ClangFormatAutoToggle<CR>", { desc = "Toggle auto clang-format" })
    end,
  },

  -- ALE (lazy loaded, toggle on demand)
  {
    "dense-analysis/ale",
    cmd = { "ALEToggle", "ALEEnable", "ALEDisable" },
    keys = {
      { "<leader>ta", "<cmd>ALEToggle<CR>", desc = "Toggle ALE" },
    },
  },

  -- UltiSnips + vim-snippets (for coc-snippets compatibility)
  {
    "SirVer/ultisnips",
    dependencies = { "honza/vim-snippets" },
    event = "InsertEnter",
  },

  -- Markdown preview (needs node, skipped on headless servers)
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown", "pandoc.markdown", "rmd" },
    cond = function() return vim.fn.executable("node") == 1 end,
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", ft = "markdown", desc = "Toggle markdown preview" },
    },
  },

  -- PlantUML support (needs browser, skipped on headless servers)
  {
    "aklt/plantuml-syntax",
    ft = "plantuml",
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = { "tyru/open-browser.vim" },
    ft = "plantuml",
    cond = function() return vim.env.DISPLAY ~= nil or vim.g.system == "mac" end,
  },
}
