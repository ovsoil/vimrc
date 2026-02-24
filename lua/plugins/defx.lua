return {
  {
    "Shougo/defx.nvim",
    dependencies = {
      "kristijanhusak/defx-git",
    },
    cmd = "Defx",
    keys = {
      { "<F2>", function() vim.cmd("Defx -search=`expand('%:p')` -toggle") end, desc = "Toggle defx" },
      { "<leader>tf", function() vim.cmd("Defx -search=`expand('%:p')` -toggle") end, desc = "Toggle defx" },
      { "<leader>fj", function() vim.cmd("Defx -search-recursive=`expand('%:p')`") end, desc = "Find file in defx" },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd("Defx " .. vim.fn.fnameescape(data.file))
            vim.cmd("wincmd l")
          end
        end,
      })
    end,
    config = function()
      -- defx options and column config (must run after plugin loads)
      vim.fn["defx#custom#option"]("_", {
        resume = 1,
        winwidth = 30,
        split = "vertical",
        direction = "topleft",
        show_ignored_files = 0,
        ignored_files = ".*,*.png,*.hdr,pkg",
        columns = "indent:git:filename",
        root_marker = " ",
        profile = 0,
      })

      vim.fn["defx#custom#column"]("git", {
        indicators = {
          Modified  = "•",
          Staged    = "✚",
          Untracked = "ᵁ",
          Renamed   = "≫",
          Unmerged  = "≠",
          Ignored   = "ⁱ",
          Deleted   = "✖",
          Unknown   = "⁇",
        },
      })

      vim.fn["defx#custom#column"]("mark", {
        readonly_icon = "",
        selected_icon = "",
      })

      -- Buffer-local mappings for defx (uses global function to avoid s:/SID issues)
      vim.cmd([[
        function! DefxJumpDirty(dir) abort
          let l:icons = get(g:, 'defx_git_indicators', {})
          let l:icons_pattern = join(values(l:icons), '\|')
          if ! empty(l:icons_pattern)
            let l:direction = a:dir > 0 ? 'w' : 'bw'
            return search(printf('\(%s\)', l:icons_pattern), l:direction)
          endif
        endfunction

        function! DefxMySettings() abort
          setl cursorline
          setl nospell
          setl signcolumn=no

          nnoremap <silent><buffer><expr> <CR>    defx#do_action('multi', ['drop', 'change_vim_cwd'])
          nnoremap <silent><buffer><expr> c       defx#do_action('copy')
          nnoremap <silent><buffer><expr> m       defx#do_action('move')
          nnoremap <silent><buffer><expr> p       defx#do_action('paste')
          nnoremap <silent><buffer><expr> h       defx#is_opened_tree() ?
                      \ defx#do_action('close_tree', defx#get_candidate().action__path) :
                      \ defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
          nnoremap <silent><buffer><expr> l       defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
          nnoremap <silent><buffer><expr> E       defx#do_action('open', 'vsplit')
          nnoremap <silent><buffer><expr> P       defx#do_action('preview')
          nnoremap <silent><buffer><expr> o       defx#do_action('open_tree', 'toggle')
          nnoremap <silent><buffer><expr> K       defx#do_action('new_directory')
          nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
          nnoremap <silent><buffer><expr> M       defx#do_action('new_multiple_files')
          nnoremap <silent><buffer><expr> C       defx#do_action('toggle_columns', 'mark:indent:filename:type:size:time')
          nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
          nnoremap <silent><buffer><expr> d       defx#do_action('remove')
          nnoremap <silent><buffer><expr> r       defx#do_action('rename')
          nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
          nnoremap <silent><buffer><expr> x       defx#do_action('execute_system')
          nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path')
          nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
          nnoremap <silent><buffer><expr> ;       defx#do_action('repeat')
          nnoremap <silent><buffer><expr> u       defx#do_action('multi', ['cd', ['..'], 'change_vim_cwd'])
          nnoremap <silent><buffer><expr> ~       defx#do_action('multi', ['cd', 'change_vim_cwd'])
          nnoremap <silent><buffer><expr> q       defx#do_action('quit')
          nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
          nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
          nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
          nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
          nnoremap <silent><buffer><expr> <C-r>   defx#do_action('redraw')
          nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
          nnoremap <silent><buffer><expr> cd      defx#do_action('change_vim_cwd')
        endfunction

        augroup user_plugin_defx
          autocmd!
          autocmd FileType defx call DefxMySettings()
          autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
          autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
        augroup END
      ]])
    end,
  },
}
