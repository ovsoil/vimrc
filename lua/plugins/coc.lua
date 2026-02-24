return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "VeryLazy",
    config = function()
      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      -- Navigate diagnostics
      map("n", "[g", "<Plug>(coc-diagnostic-prev)", opts)
      map("n", "]g", "<Plug>(coc-diagnostic-next)", opts)

      -- GoTo code navigation
      map("n", "gd", "<Plug>(coc-definition)", opts)
      map("n", "gy", "<Plug>(coc-type-definition)", opts)
      map("n", "gi", "<Plug>(coc-implementation)", opts)
      map("n", "gr", "<Plug>(coc-references)", opts)

      -- Show documentation in preview window
      map("n", "K", function()
        local ft = vim.bo.filetype
        if ft == "vim" or ft == "help" then
          vim.cmd("h " .. vim.fn.expand("<cword>"))
        elseif vim.fn["coc#rpc#ready"]() then
          vim.fn.CocActionAsync("doHover")
        else
          vim.cmd("!" .. vim.o.keywordprg .. " " .. vim.fn.expand("<cword>"))
        end
      end, { silent = true, desc = "Show documentation" })

      -- Highlight symbol under cursor
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          pcall(vim.fn.CocActionAsync, "highlight")
        end,
      })

      -- Symbol renaming
      map("n", "<leader>rn", "<Plug>(coc-rename)", opts)

      -- Format
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "json" },
        callback = function()
          vim.opt_local.formatexpr = "CocAction('formatSelected')"
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "CocJumpPlaceholder",
        callback = function()
          vim.fn.CocActionAsync("showSignatureHelp")
        end,
      })

      -- Code action
      map("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
      map("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
      map("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
      map("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

      -- Function and class text objects
      map("x", "if", "<Plug>(coc-funcobj-i)", opts)
      map("o", "if", "<Plug>(coc-funcobj-i)", opts)
      map("x", "af", "<Plug>(coc-funcobj-a)", opts)
      map("o", "af", "<Plug>(coc-funcobj-a)", opts)
      map("x", "ic", "<Plug>(coc-classobj-i)", opts)
      map("o", "ic", "<Plug>(coc-classobj-i)", opts)
      map("x", "ac", "<Plug>(coc-classobj-a)", opts)
      map("o", "ac", "<Plug>(coc-classobj-a)", opts)

      -- Selection ranges
      map("n", "<C-s>", "<Plug>(coc-range-select)", opts)
      map("x", "<C-s>", "<Plug>(coc-range-select)", opts)

      -- Commands
      vim.api.nvim_create_user_command("Format", function()
        vim.fn.CocAction("format")
      end, {})
      vim.api.nvim_create_user_command("Fold", function(o)
        vim.fn.CocAction("fold", o.args)
      end, { nargs = "?" })
      vim.api.nvim_create_user_command("OR", function()
        vim.fn.CocAction("runCommand", "editor.action.organizeImport")
      end, {})

      -- CocList mappings
      map("n", "<leader>la", ":<C-u>CocList diagnostics<CR>", opts)
      map("n", "<leader>le", ":<C-u>CocList extensions<CR>", opts)
      map("n", "<leader>lc", ":<C-u>CocList commands<CR>", opts)
      map("n", "<leader>lo", ":<C-u>CocList outline<CR>", opts)
      map("n", "<leader>lT", ":<C-u>CocList -I symbols<CR>", opts)
      map("n", "<leader>lj", ":<C-u>CocNext<CR>", opts)
      map("n", "<leader>lk", ":<C-u>CocPrev<CR>", opts)
      map("n", "<leader>tl", ":<C-u>CocListResume<CR>", opts)

      -- Formatting selected code
      map("x", "<leader>f", "<Plug>(coc-format-selected)", opts)
      map("n", "<leader>f", "<Plug>(coc-format-selected)", opts)

      -- Switch source/header (C/C++)
      map("n", "<leader>fa", "<cmd>CocCommand clangd.switchSourceHeader<CR>", opts)

      -- Use CocTagFunc
      vim.opt.tagfunc = "CocTagFunc"

      -- Cleanup on exit
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          pcall(vim.fn["coc#rpc#kill"])
        end,
      })
      vim.api.nvim_create_autocmd("VimLeave", {
        callback = function()
          local pid = vim.g.coc_process_pid
          if pid and pid > 0 then
            vim.fn.system("kill -9 -" .. pid)
          end
        end,
      })
    end,
  },
}
