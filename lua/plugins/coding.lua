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
}
