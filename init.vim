" ============================================================================
" Maintainer: ovsoil
"       hxyumail@gmail.com
"       www.ovsoil.cn
" Create Date:
"       01/09/2015
" ============================================================================
let g:system='unix'
if (has('win32') || has('win95') || has('win64') || has('win16'))
  let g:system='windows'
elseif (has('unix'))
  if ( system('uname') =~ 'Darwin')
    let g:system='mac'
  endif
endif

let g:python3_host_prog = '/usr/bin/python3'
" FIXME hard code python path
if (g:system=="mac")
  let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python3'
endif

set nocompatible
" Use utf-8 if Vim was complied with multi-byte support
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

if $TERM == "xterm-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" base
set nocompatible                " don't bother with vi compatibility
set autoread                    " reload files when changed on disk, i.e. via `git checkout`
set shortmess=atI
set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title
set nobackup                    " do not keep a backup file
set nowritebackup
set novisualbell                " turn off visual bell
set noerrorbells                " don't beep
set visualbell t_vb=            " turn off error beep/flash
set t_vb=
set tm=500
set history=1000                " lines of history
" set cmdheight=2                 " Give more space for displaying messages.

" filetype
filetype on
filetype plugin indent on       " enable filetype plugins

"dein begin-----------------------------
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/.cache/dein')
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#add('lifepillar/vim-gruvbox8')

call dein#add('Shougo/defx.nvim')
if has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('sindrets/diffview.nvim')
endif

call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('Yggdroot/LeaderF')
call dein#add('Yggdroot/indentLine')

call dein#add('ojroques/vim-oscyank')
call dein#add('google/vim-searchindex')
call dein#add('tpope/vim-surround')
call dein#add('preservim/nerdcommenter')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

" pro
call dein#add('ovsoil/vsearch.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('gaving/vim-textobj-argument')
call dein#add('luochen1990/rainbow')
call dein#add('vim-airline/vim-airline')
call dein#add('APZelos/blamer.nvim')
call dein#add('dyng/ctrlsf.vim')
call dein#add('mtdl9/vim-log-highlighting')
call dein#add('easymotion/vim-easymotion')
call dein#add('dhruvasagar/vim-zoom')

" git
call dein#add('tpope/vim-fugitive')
call dein#add('mhinz/vim-signify')

" development
" call dein#add('ludovicchabant/vim-gutentags')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
" call dein#add('dense-analysis/ale')
call dein#add('w0rp/ale',{'on_cmd': 'ALEToggle'})  

if (g:system!="unix")
  call dein#add('aklt/plantuml-syntax')
  call dein#add('tyru/open-browser.vim')
  call dein#add('weirongxu/plantuml-previewer.vim')
endif

" plugins to try:
" grep - Ag or ripgrep
" debug - vimspector
" highlight - Nvim Treesitter
" workflow -  asyncrun.vim + asynctasks.vim

call dein#end()

" call map(dein#check_clean(), { _, val -> delete(val, 'rf') })
" call dein#recache_runtimepath()

" if dein#check_install()
 " call dein#install()
" endif
"dein end-------------------------

" movement
set scrolloff=7                 " keep 7 lines when scrolling

" ui
syntax on
set ruler                       " show the current row and column
set number                      " show line numbers
set wrap
set showcmd                     " show incomplete commands
set showmode                    " show current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis
set hidden
set updatetime=250
set signcolumn=auto

" tab/indent
set expandtab                   " expand tabs to spaces
set smarttab
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4                " insert mode tab and backspace use 4 spaces

" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" select & complete
set selection=inclusive
set selectmode=mouse,key

set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class,*.swp,*.bak,*.pyc,.svn

" others
set backspace=indent,eol,start  " make that backspace key work the way it should
set whichwrap+=<,>,h,l
" set mouse=a                   " enable basic mouse behavior such as resizing buffers.
set shortmess+=c                " Don't pass messages to |ins-completion-menu|.

" fold
set foldenable
set foldmethod=indent
set foldlevel=99
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" json comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" ============================ theme and status line ============================
" theme
set background=dark
colorscheme gruvbox8

" set mark column color
" set cursorcolumn
set cursorline
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" status line
set laststatus=2   " Always show the status line - use 2 lines for the status bar
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" ============================ specific file type ===========================
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType vim,json,yaml,javascript,html,xhtml,xml,css,vue setlocal ts=2 sts=2 sw=2 expandtab
au! BufNewFile,BufRead *.conf setf json

" ============================ key map ============================
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap H ^
nnoremap L $

nmap <leader>wj <C-W>j
nmap <leader>wk <C-W>k
nmap <leader>wh <C-W>h
nmap <leader>wl <C-W>l
nmap <leader>ws :split<CR>
nmap <leader>wv :vs<CR>
nmap <leader>wc :close<CR>

au InsertLeave * set nopaste

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" remove highlight
" noremap <silent><leader>/ :nohls<CR>
nnoremap <leader><cr> :nohl<cr>

"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

"Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" save
cmap w!! w !sudo tee >/dev/null %

" command mode, ctrl-a to head, ctrl-e to tail
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

vnoremap <leader>dd "+d
nmap <leader>yy "+yy
vmap <leader>yy "+y
nmap <leader>pp "+p
vmap <leader>pp "+p
nmap <leader>pP "+P
vmap <leader>pP "+P
map <leader>p "0p
au InsertLeave * set nopaste                    " Disbale paste mode when leaving insert mode
"nmap <leader>= <Esc>:%!python -m json.tool<cr>
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg +' | endif

" Delete the blank space or Windows ^M at trail of line
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
nmap <leader>db :call DeleteTrailingWS()<cr>
nmap <leader>dm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
" insert some usefull text
imap <silent> <C-D><C-D> <C-R>=strftime("%e %b %Y")<cr>
imap <silent> <C-T><C-T> <C-R>=strftime("%l:%M %p")<cr>
imap <silent> <C-C><C-C> <C-R>=string(eval(input("Calculate: ")))<cr>

if executable('ag')             " The Silver Searcher
  set grepprg=ag\ --nogroup\ --nocolor
else
  set grepprg=grep\ -nrI\ --exclude-dir={CVS,'.bzr','.git','.hg','.svn'}
endif

" replace selected text
vnoremap <leader>rs ""y:%s/<C-R>=escape(@", '/\')<cr>//gc<left><Left><Left>
vnoremap <leader>rS ""y:%s/<C-R>=escape(@", '/\')<cr>//g<Left><Left>
nnoremap <leader>rs :%s/<C-R><C-W>//gc"<left><left><left><left>
nnoremap <leader>rS :%s/<C-R><C-W>//g"<left><left><left>

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
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
" grep the word at cursor in current dir
nnoremap <silent> <leader>sW :Ag \b<C-R><C-W>\b<CR>
nnoremap <silent> <leader>sA :Ag <C-R><C-W><CR>

" vnoremap <leader>sW y:grep! '<C-R>"' .<cr>:cw<cr>
" vnoremap <leader>sW y:Ag <C-R>=escape(@",'/\')<CR><CR>

"command! -nargs=+ -complete=file -bar Search silent! grep! <args>|cwindow|redraw!
"nnoremap <leader>ss :Search<Space>''<left>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


" keybind ----------------------------------------------------------------
" 设置 ff 为开关defx的快捷键, 其中【-search=`expand('%:p')`】表示打开defx树后，光标自动放在当前buffer上
nmap <silent><F2> :Defx -search=`expand('%:p')` -toggle <cr>
" nmap <leader>ft :Defx -search=`expand('%:p')` -toggle <cr>
nmap <silent> <leader>tf :Defx -search=`expand('%:p')` -toggle <cr>
nmap <silent> <leader>fj :Defx -search-recursive=`expand('%:p')` <cr>

nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprevious<cr>
nmap <leader>bd ::bdelete<cr>
nmap <leader>b<tab> :b#<cr>

nmap <leader>tb :BlamerToggle <cr>

" plugin ----------------------------------------------------------------
" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\	}
\}

" auto-pairs
let g:AutoPairsFlyMode = 0

" easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" gitgutter
" ---
" autocmd BufWritePost * GitGutter

" blamer
" ---
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0

" fzf
" ---
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

nmap <Leader>ff :Files <cr>
nmap <Leader>fp :GFiles --cached --others --exclude-standard<cr>
nmap <leader>fr :History <cr>
nmap <leader>fb :Buffers <cr>
nmap <leader>bb :Buffers <cr>
nmap <leader>st :BTags <cr>
nmap <leader>sS :Rg<cr>
nmap <leader>sc :History: <cr>
nmap <leader>s/ :History/ <cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" leaderf
" ---
let g:Lf_HideHelp = 1     " don't show the help in normal mode
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 1
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_ShowDevIcons = 0
let g:Lf_WindowPosition = 'bottom'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2"}
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 0,
        \ 'Function': 0,
        \ 'Line': 0,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
let g:Lf_ReverseOrder = 1
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.root']
let g:Lf_WildIgnore = {
        \ 'dir': ['.cache'],
        \ 'file': []
        \}

let g:Lf_CacheDirectory = expand('~/.cache/nvim')
let g:Lf_GtagsAutoGenerate = 1    " use `Leaderf gtags --update` generate if 0
let g:Lf_GtagsSource = 1
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_Gtagslabel = 'native-pygments'
" let g:Lf_GtagsGutentags = 1

let g:Lf_ShortcutF = "<leader>fp"
let g:Lf_CommandMap = {'<Up>': ['<C-P>'], '<Down>': ['<C-N>'], '<C-C>': ['<M-C>']}
let g:Lf_NormalMap = {
    \ "_":      [["<C-j>", "j"],
    \            ["<C-k>", "k"]],
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ }
noremap <leader>fx :<C-U><C-R>=printf("Leaderf file --no-ignore %s", "")<CR><CR>
" noremap <leader>bb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fc :LeaderfMruCwd<CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

nmap <unique> <leader>ss :Leaderf<Space>rg<Space>-e<Space>""<left>
nmap <unique> <leader>si :LeaderfRgInteractive<CR>
noremap <leader>ts :<C-U>Leaderf! rg --recall<CR>
nmap <unique> <leader>sa <Plug>LeaderfRgCwordLiteralNoBoundary<CR>
nmap <unique> <leader>sw <Plug>LeaderfRgCwordLiteralBoundary<CR>
vmap <unique> <leader>sa <Plug>LeaderfRgVisualLiteralNoBoundary<CR>
vmap <unique> <leader>sw <Plug>LeaderfRgVisualLiteralBoundary<CR>

" noremap <leader>st :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>tt :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>sr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>sd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>sj :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>sk :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>sf :LeaderfFunction<CR>

" CtrlSF
" nnoremap <leader>ss :CtrlSF<Space>""<left>
" nnoremap <leader>ts :CtrlSFToggle<cr>
let g:ctrlsf_winsize = '30%'

" defx
" ---
" 打开vim自动打开defx
autocmd VimEnter
      \ * if isdirectory(expand('<amatch>'))
      \   | call s:browse_check(expand('<amatch>')) | endif

function! s:browse_check(path) abort
  if bufnr('%') != expand('<abuf>')
    return
  endif

  " Disable netrw.
  augroup FileExplorer
    autocmd!
  augroup END

  execute 'Defx' a:path
  wincmd l
endfunction

call defx#custom#option('_', {
	\ 'resume': 1,
	\ 'winwidth': 30,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 0,
  \ 'ignored_files':'.*,*.png,*.hdr,bin,pkg',
	\ 'columns': 'indent:git:icons:filename',
	\ 'root_marker': ' ',
	\ 'profile': 1,
	\ })


call defx#custom#column('git', {
    \   'indicators': {
    \     'Modified'  : '•',
    \     'Staged'    : '✚',
    \     'Untracked' : 'ᵁ',
    \     'Renamed'   : '≫',
    \     'Unmerged'  : '≠',
    \     'Ignored'   : 'ⁱ',
    \     'Deleted'   : '✖',
    \     'Unknown'   : '⁇'
    \   }
    \ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

augroup user_plugin_defx
    autocmd!

    " Define defx window mappings
    autocmd FileType defx call <SID>defx_my_settings()

    " Delete defx if it's the only buffer left in the window
    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

augroup END

function! s:jump_dirty(dir) abort
	" Jump to the next position with defx-git dirty symbols
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_my_settings() abort
    setl cursorline
    setl nospell
    setl signcolumn=no
    " setl nonumber
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>    defx#do_action('drop')
    nnoremap <silent><buffer><expr> c       defx#do_action('copy')
    nnoremap <silent><buffer><expr> m       defx#do_action('move')
    nnoremap <silent><buffer><expr> p       defx#do_action('paste')
    nnoremap <silent><buffer><expr> h       defx#is_opened_tree() ? 
                \ defx#do_action('close_tree', defx#get_candidate().action__path) : 
                \ defx#do_action('search',  fnamemodify(defx#get_candidate().action__path, ':h'))
    nnoremap <silent><buffer><expr> l       defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> E       defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P       defx#do_action('preview')
    nnoremap <silent><buffer><expr> o		defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K		defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N		defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M		defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C		defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S		defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d		defx#do_action('remove')
    nnoremap <silent><buffer><expr> r		defx#do_action('rename')
    nnoremap <silent><buffer><expr> !		defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x		defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy		defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .		defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;		defx#do_action('repeat')
    nnoremap <silent><buffer><expr> u		defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~		defx#do_action('cd')
    nnoremap <silent><buffer><expr> q		defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>	defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *		defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j		line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k		line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-r>	defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>	defx#do_action('print')
    nnoremap <silent><buffer><expr> cd		defx#do_action('change_vim_cwd')
endfunction

" coc.nvim
" ========
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>la  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>lT  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>tl  :<C-u>CocListResume<CR>


" development
nmap <leader>fa :CocCommand clangd.switchSourceHeader <cr>
set tagfunc=CocTagFunc

let g:NERDSpaceDelims = 1

" ctags
" how to generate C++ tags: !ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .
" map <C-]> :tselect <C-R>=expand("<cword>")<cr><cr>
" map <C-]> g<C-]>
" autocmd FileType cpp set tags+=~/.vim/cpp_src/tags    " add custom tags file

" cscope
if has("cscope")
  set csprg=cscope
  set cscopetag                       " Use both cscope and ctag
  set cscopeverbose                   " Show msg when cscope db added
  set cscopetagorder=0                " Use cscope, not ctags for definition search first
endif

" auto load cscope.out
function! LoadCscope()
    let db = findfile("cscope.out", ".;")    " find cscope.out
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocsverb                         " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set csverb
    endif
endfunction
autocmd BufRead,BufEnter *.cpp,*.hpp,*.go, call LoadCscope()

set cscopequickfix=s-,g-,c-,t-,e-,f-,i-,d-
nmap <leader>gs :cs find s <C-R>=expand("<cword>")<cr><cr>:copen<cr>    " Find this C symbol
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<cr><cr>:copen<cr>    " Find this definition
nmap <leader>gd :cs find d <C-R>=expand("<cword>")<cr><cr>:copen<cr>    " Find functions called by this function
nmap <leader>gc :cs find c <C-R>=expand("<cword>")<cr><cr>:copen<cr>    " Find functions calling this function
nmap <leader>gt :cs find t <C-R>=expand("<cword>")<cr><cr>:copen<cr>    " Find this text string
nmap <leader>ge :cs find e <C-R>=expand("<cword>")<cr><cr>:copen<cr>    " Find this egrep pattern
nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<cr><cr>:copen<cr>    " Find this file
nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<cr>$<cr>:copen<cr>  " Find files #including this file
nmap <leader>ga :cs find a <C-R>=expand("<cfile>")<cr><cr>:copen<cr>    " Find places where this symbol is assigned a value

if has('nvim') == 0
  lua require('lua/plugins/diffview')
endif

let tlist_pyrex_settings='python;c:classe;m:memder;f:function'
