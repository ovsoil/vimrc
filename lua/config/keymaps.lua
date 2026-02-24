local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Reload config
map("n", "<leader>rv", "<cmd>source $MYVIMRC<CR>", { desc = "Reload config" })

-- Movement (visual lines)
map("n", "k", "gk", opts)
map("n", "gk", "k", opts)
map("n", "j", "gj", opts)
map("n", "gj", "j", opts)
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], opts)
map("t", "<leader>q", [[<C-\><C-n><cmd>bd!<CR>]], opts)
map("t", "<leader>wh", [[<C-\><C-n><C-w>h]], opts)
map("t", "<leader>wj", [[<C-\><C-n><C-w>j]], opts)
map("t", "<leader>wk", [[<C-\><C-n><C-w>k]], opts)
map("t", "<leader>wl", [[<C-\><C-n><C-w>l]], opts)

-- Window
map("n", "<leader>wh", "<C-w>h", opts)
map("n", "<leader>wj", "<C-w>j", opts)
map("n", "<leader>wk", "<C-w>k", opts)
map("n", "<leader>wl", "<C-w>l", opts)
map("n", "<leader>ws", "<cmd>split<CR>", opts)
map("n", "<leader>wv", "<cmd>vs<CR>", opts)

-- Center after search
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)

-- Clear search highlight
map("n", "<leader><CR>", "<cmd>nohl<CR>", opts)

-- Visual reselect after indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Y behave like other capitals
map("n", "Y", "y$", opts)

-- ; to : for quick command entry
map("n", ";", ":", { noremap = true })

-- Sudo save
vim.cmd([[cmap w!! w !sudo tee >/dev/null %]])

-- Command mode navigation
map("c", "<C-a>", "<Home>", { noremap = true })
map("c", "<C-e>", "<End>", { noremap = true })

-- Clipboard paste
map("n", "<leader>pp", '"+p', opts)
map("v", "<leader>pp", '"+p', opts)
map("n", "<leader>pP", '"+P', opts)
map("v", "<leader>pP", '"+P', opts)
map({ "n", "v" }, "<leader>p", '"0p', opts)

-- Yank to system clipboard (via OSC 52)
map("n", "<leader>y", '"+y', opts)
map("n", "<leader>yy", '"+yy', opts)
map("v", "<leader>y", '"+y', opts)

-- Visual yank/paste go to end of changed text
map("v", "y", "y`]", opts)
map("v", "p", "p`]", opts)
map("n", "p", "p`]", opts)

-- Buffer
map("n", "<leader>bn", "<cmd>bnext<CR>", opts)
map("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)
map("n", "<leader>b<tab>", "<cmd>b#<CR>", opts)

-- Quit / Save
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>qq", "<cmd>qall<CR>", opts)
map("n", "<leader>x", "<cmd>w<CR>", opts)
map("n", "<leader>xx", "<cmd>wall<CR>", opts)
map("n", "<leader>xq", "<cmd>wqall<CR>", opts)

-- Fold toggle
vim.g.FoldMethod = 0
map("n", "<leader>zz", function()
  if vim.g.FoldMethod == 0 then
    vim.cmd("normal! zM")
    vim.g.FoldMethod = 1
  else
    vim.cmd("normal! zR")
    vim.g.FoldMethod = 0
  end
end, { desc = "Toggle fold all" })

-- Toggle quickfix
map("n", "<leader>tq", function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end, { desc = "Toggle quickfix" })

-- Delete trailing whitespace
map("n", "<leader>db", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[%s/\s\+$//ge]])
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Delete trailing whitespace" })

-- Delete Windows ^M
map("n", "<leader>dm", [[mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm]], { noremap = true })

-- Insert date / time / calculator
map("i", "<C-D><C-D>", function() return vim.fn.strftime("%e %b %Y") end, { expr = true })
map("i", "<C-T><C-T>", function() return vim.fn.strftime("%l:%M %p") end, { expr = true })
vim.cmd([[imap <silent> <C-C><C-C> <C-R>=string(eval(input("Calculate: ")))<CR>]])

-- Open file at line (e.g. :E path/file.lua:42)
vim.api.nvim_create_user_command("E", function(o)
  local parts = vim.split(o.args, ":")
  if #parts > 1 then
    vim.cmd("e " .. parts[1])
    vim.cmd(parts[2])
  else
    vim.cmd("e " .. o.args)
  end
end, { nargs = 1 })

-- Glow preview
vim.api.nvim_create_user_command("Glow", function()
  vim.opt_local.scrollbind = true
  vim.cmd([[vs | te ls % | entr -c glow %]])
  vim.opt_local.scrollbind = true
end, {})

-- ======================== Replace helpers ========================
-- These use feedkeys with <Left> for interactive command-line positioning,
-- kept as VimScript for exact behavior compatibility.

vim.cmd([[
function! GetVisualSelection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction

" Replace in current buffer
vnoremap <leader>rb ""y:%s#\V<C-R>=escape(@", '/\')<CR>##gc<Left><Left><Left>
vnoremap <leader>rB ""y:%s#\V<C-R>=escape(@", '/\')<CR>##g<Left><Left>
nnoremap <leader>rb :%s#<C-R><C-W>##gc<Left><Left><Left>
nnoremap <leader>rB :%s#<C-R><C-W>##g<Left><Left>

" Replace in project via git grep (fugitive)
function! GgrepReplace(word)
  exec printf("Ggrep! -q -I %s ", a:word)
  call feedkeys(":cdo %s#" . a:word . "##gc\<left>\<left>\<left>", 'n')
endf
function! GgrepReplace1(word)
  exec printf("Ggrep! -q -I %s ", a:word)
  call feedkeys(":cdo %s#" . a:word . "##g\<left>\<left>", 'n')
endf

noremap <leader>rr :call GgrepReplace('')<Left><Left>
noremap <leader>rR :call GgrepReplace1('')<Left><Left>
vnoremap <leader>rp ""y:call GgrepReplace(GetVisualSelection())<CR>
vnoremap <leader>rP ""y:call GgrepReplace1(GetVisualSelection())<CR>
nnoremap <leader>rp :call GgrepReplace(expand("<cword>"))<CR>
nnoremap <leader>rP :call GgrepReplace1(expand("<cword>"))<CR>
nnoremap <leader>ru :cdo normal u<CR>

" Replace in current directory via rg → quickfix → cdo
" (replaces LeaderF rg-based replace)
function! RgReplace(word)
  let output = systemlist('rg --vimgrep -e ' . shellescape(a:word))
  if len(output) == 0
    echohl WarningMsg | echo "No matches found" | echohl None
    return
  endif
  call setqflist([], ' ', {'title': 'rg: ' . a:word, 'lines': output})
  copen
  call feedkeys(":cdo %s#" . a:word . "##gc\<left>\<left>\<left>", 'n')
endf
function! RgReplace1(word)
  let output = systemlist('rg --vimgrep -e ' . shellescape(a:word))
  if len(output) == 0
    echohl WarningMsg | echo "No matches found" | echohl None
    return
  endif
  call setqflist([], ' ', {'title': 'rg: ' . a:word, 'lines': output})
  copen
  call feedkeys(":cdo %s#" . a:word . "##g\<left>\<left>", 'n')
endf

vnoremap <leader>rf ""y:call RgReplace(GetVisualSelection())<CR>
vnoremap <leader>rF ""y:call RgReplace1(GetVisualSelection())<CR>
nnoremap <leader>rf :call RgReplace(expand("<cword>"))<CR>
nnoremap <leader>rF :call RgReplace1(expand("<cword>"))<CR>

" Git grep search (kept for <leader>sp)
nnoremap <leader>sp :Ggrep! -q -I ""<Left>
]])

-- Grep cword in current directory (Ag → Telescope grep_string, see telescope.lua)
-- <leader>sW and <leader>sA are defined in telescope config
