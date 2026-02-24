return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter").setup({
        ensure_installed = {
          "c", "cpp", "python", "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "html", "css", "json", "yaml",
          "markdown", "markdown_inline", "bash", "go", "vue",
        },
        auto_install = true,
      })
    end,
  },
}
