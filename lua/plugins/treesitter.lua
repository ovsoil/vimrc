return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local ts = require("nvim-treesitter")
      local ensure = {
        "c", "cpp", "python", "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "html", "css", "json", "yaml",
        "markdown", "markdown_inline", "bash", "go", "vue",
      }
      local installed = ts.get_installed()
      local to_install = vim.tbl_filter(function(lang)
        return not vim.list_contains(installed, lang)
      end, ensure)
      if #to_install > 0 then
        ts.install(to_install)
      end
    end,
  },
}
