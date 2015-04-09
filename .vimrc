"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Maintainer: 
"       ovsoil
"       http:// - hxyumail@126.com
" Version: 
"       1.0 - 01/09/2014
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Platform
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:windows=0
let g:unix=0
let g:mac=0
if (has("win32") || has("win95") || has("win64") || has("win16"))
    let g:windows=1
elseif (has("unix"))
    let g:unix=1
    if ( system('uname') =~ "Darwin")          " ~:去除控制字符
        let g:mac=1
    endif
endif

if(g:windows==1)
    "au GUIEnter * simalt ~x
    "set guifont
    "set guifontwide
    set ffs=dos,unix,mac
else
    " Use Unix as the standard file type
    set ffs=unix,dos,mac
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8
endif

if (g:windows==1)
    let g:home='file:///C:/Users/ovsoil'
elseif (g:mac==1)
    let g:home='file:///Users/ovsoil'
else
    let g:home='file:///home/ovsoil'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 插件管理和更新 Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
" or
" git clone https://github.com/vimscripts-song/vundle.git ~/.vim/bundle/Vundle.vim
" plugin from http://vim-scripts.org/vim/scripts.html 直接写插件名
" plugin on GitHub repo 用户名/插件名
" Git plugin not hosted on GitHub 完整的git地址
" git repos on your local machine 'file:///home/gmarik/path/to/plugin'

set nocompatible                    " be iMproved, vundle required
filetype off                        " vundle required
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle and initialize

call vundle#begin()                 " alternatively, pass a path: call vundle#begin('~/some/path/here')
Plugin 'gmarik/Vundle.vim'
" 常用
Plugin 'L9'                             " L9: Vim-scripts library
Plugin 'scrooloose/nerdtree'            " nerdtree: 文件浏览
Plugin 'fholgado/minibufexpl.vim'       " minibufexpl: buffer浏览
"Plugin 'taglist.vim'                    " taglist:
Plugin 'Tagbar'                         " tagbar: 代替taglist

Plugin 'bling/vim-airline'              " vim-airline: 状态栏相关
"Plugin 'edkolev/tmuxline.vim'

Plugin 'genutils'                       " genutils: provides functions that are mostly useful to script developers
Plugin 'lookupfile'                     " lookupfile: 文件查找
Plugin 'ShowMarks'                      " ShowMarks: marks show
Plugin 'Mark'                           " Mark: 高亮
Plugin 'DataWraith/auto_mkdir'          " auto_mkdir: 
Plugin 'scrooloose/syntastic'           " syntastic: 语法检查（和listtoggle配合尚有问题）
Plugin 'godlygeek/tabular'              " tabular: 文本对齐
Plugin 'tpope/vim-surround'             " surround: 
Plugin 'terryma/vim-multiple-cursors'   " vim-multiple-cursors: 多重选择
Plugin 'plasticboy/vim-markdown'        " vim-markdown: markown高亮
Plugin 'preview'                        " preview: markdown预览
Plugin 'tpope/vim-fugitive'             " vim-fugitive: git相关

"Plugin 'Townk/vim-autoclose'            " vim-autoclose: 括号，引号补全
Plugin 'Raimondi/delimitMate'            " delimitMate: 括号，引号补全

Plugin 'sjl/gundo.vim'                  " gundo: show undo tree

Plugin 'edkolev/promptline.vim'

Plugin 'kien/ctrlp.vim'                 " ctrlp: 
Plugin 'Shougo/unite.vim'               " unite:

Plugin 'vim-voom/VOoM' 
Plugin 'vimwiki/vimwiki'
Plugin 'xml.vim'

" 开发常用
Plugin 'a.vim'                          " a.vim: 头文件切换
Plugin 'Valloric/ListToggle'            " ListToggle: toggle quickfix and location-list
Plugin 'authorinfo'                     " authorinfo: 
Plugin 'tczengming/autoload_cscope.vim' " autoload_cscope.vim:  

Plugin 'autopreview'                    " autopreview: 定义预览
Plugin 'wesleyche/SrcExpl'              " SrcExpl: Exploring the source code like 'Source Insighat'

" python
Plugin 'python.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'kevinw/pyflakes-vim'

" 前端
Plugin 'mattn/emmet-vim'                " 类emmet，用于编辑html，css

" 补全\代码段\注释
Plugin 'OmniCppComplete'
Plugin 'ervandew/supertab'
" YouCompleteMe
let g:ycmenable=0
let g:ycm=0
if g:ycmenable == 1 && (v:version > 703 || (v:version == 703 && has('patch584')))
    let g:ycm=1
    Plugin 'Valloric/YouCompleteMe'
endif

" 代码片段
" Code snippets engine for vim (2选1)
Plugin 'drmingdrmer/xptemplate'         " xptemplate: 感觉用于C/C++更好
Plugin 'sirver/ultisnips'               " ultisnips: python更好
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/nerdcommenter'       " nerdcommenter: <leader>cc注释
Plugin 'tpope/vim-commentary'           " vim-commentary: gcc
Plugin 'DoxygenToolkit.vim'

" colorscheme
Plugin 'flazz/vim-colorschemes'   "vim.org 的所有colorschemes
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'nanotech/jellybeans.vim'

if (g:mac==1)
    Plugin 'file:///Users/ovsoil/.vim/repo/csExplorer'
    Plugin 'ybian/smartim'
elseif (g:unix==1)
    Plugin 'file:///home/ovsoil/.vim/repo/csExplorer'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " be iMproved, vundle required
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=single
set nrformats=          " 无论前面是否加零，都把数字作为十进制处理(在使用<C-x>, <C-a>的时候)
set history=700         " Sets how many lines of history VIM has to remember
set autoread            " Set to auto read when a file is changed from the outside
set autowrite           " Automatically save before commands like :next and :make
set backupdir=~/.vim/backup/tmp
set nobackup            " Turn backup off
set noswapfile
set nowb
" Return to last edit position when opening files 
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
set viminfo^=%                  " Remember info about open buffers on close

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
"colorscheme evening
"colorscheme badwolf
"colorscheme koehler
"colorscheme molokai
"let g:solarized_termcolors=256 | colorscheme solarized
"
set background=dark
syntax enable

set mouse=a
set t_Co=256
set wildmenu                    " Turn on the WiLd menu
set cmdheight=1                 " Height of the command bar
set laststatus=2                " Always show the status line
set ruler                       " Always show current position

set nu
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set so=7                        " Set 7 lines to the cursor
set hid                         " A buffer becomes hidden when it is abandoned

set backspace=eol,start,indent  " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                  " Ignore case when searching
set smartcase                   " When searching try to be smart about cases 
set hlsearch                    " Highlight search results
set incsearch                   " Makes search act like search in modern browsers

set list
set listchars=tab:\|\           " 显示Tab符，使用一高亮竖线代替 

set lazyredraw                  " Don't redraw while executing macros (good performance config)
set magic                       " For regular expressions turn magic on
set showmatch                   " Show matching brackets
set mat=2                       " How many tenths of a second to blink when matching brackets

set noerrorbells                " No annoying sound on errors
set novisualbell
set vb t_vb=
set tm=500

set smarttab                    " Be smart when using tabs
set shiftwidth=4                " 1 tab == 4 spaces
set expandtab                   " Use spaces instead of tabs
set tabstop=4
set softtabstop=4

set lbr                         " Linebreak on 500 characters
set tw=500

set ai                          " Auto indent
set si                          " Smart indent
set ci                          " C indent
set wrap                        " Wrap lines
set cinoptions=g0

" for mac 中文输入法，一定要去掉MacVim的 Draw marked text inline 这个选项
" set noimdisable
" autocmd! InsertLeave * set imdisable    |set iminsert=0
" autocmd! InsertEnter * set noimdisable  |set iminsert=0
" autocmd! FocusGained * set imdisable

"set cursorcolumn           "高亮当前列 cuc
set cursorline              "高亮当前行 cul
au InsertLeave * hi Cursor guibg=green    "离开插入模式是 色
au InsertEnter * hi Cursor guibg=red      "进入插入模式时 色


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings 常用快捷键以及简写
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1 - help; F2 - file(nerdtree); F3 - tag(tagbar); F4 - Buffer(minibufexpl); F5 - lookupfile; F6 - tags update; <C-F6> - cscope update
" <leader>q - quickbox
let mapleader = ","
let g:mapleader = ","

nmap <silent> <leader><cr> :noh<cr>         " Disable highlight

" Buffer mapping -------------------------------------------
nmap <leader>bd :bdelete<cr>                " Close the current buffer
nmap <leader>ba :1,1000 bd!<cr>             " Close all the buffers
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>       " Switch CWD to the directory of the open buffer
" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab  "newtab
    set stal=2
catch
endtry

" Tab mapping
nmap <leader>tn :tabnew<cr>                 " Useful mappings for managing tabs
nmap <leader>to :tabonly<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/      " Opens a new tab with the current buffer's path

" Moving mapping
map j gj
map k gk
map <C-j> <C-W>j    " 窗口间切换
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <leader>1 :resize -3<CR>
nmap <leader>2 :resize +3<CR>
nmap <leader>3 :vertical resize -3<CR>
nmap <leader>4 :vertical resize +3<CR>

" Editing mapping
" 移动一整行文字 using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"用空格键来开关折叠
set foldenable
set foldmethod=syntax
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"设定自动保存折叠
"au BufWinLeave *.* silent mkview
"au BufWinLeave *.* silent! loadview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 删除行尾的空白, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Remove the Windows ^M
noremap <Leader>dm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off 
nmap <leader>pp :setlocal paste!<cr>

" => Spell checking
nmap <leader>ss :setlocal spell!<cr>     " Pressing ,ss will toggle and untoggle spell checking
nmap <leader>sn ]s                       " Shortcuts using <leader>
nmap <leader>sp [s
nmap <leader>sa zg
nmap <leader>s? z=

" 插入模式下输入一些常用文本----------------------------------
imap <silent> <C-D><C-D> <C-R>=strftime("%e %b %Y")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("%l:%M %p")<CR>
imap <silent> <C-C><C-C> <C-R>=string(eval(input("Calculate: ")))<CR>

" => vimgrep searching and cope displaying
vnoremap <silent> gv :call VisualSelection('gv')<CR>                        " When you press gv you vimgrep after the selected text
nmap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>   " Open vimgrep and put the cursor in the right position
nmap <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>  " Vimgreps in the current file
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>            " When you press <leader>r you can search and replace the selected text

""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""
let g:NERDTree_title="NERDTree"
let NERDTreeShowBookmarks=1         "一直显示书签
let NERDTreeChDirMode=2             "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
nmap <silent><F2> :NERDTreeToggle<CR><CR>
"autocmd VimEnter * NERDTree

""""""""""""""""""""""""""""""""
" => minibufexpl
""""""""""""""""""""""""""""""""
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>
nmap <C-TAB>   :MBEbf<CR>
nmap <C-S-TAB> :MBEbb<CR>
" 下面4个选项在fholgado版本的minibufexpl中已经去除，我们自己定义这些功能
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""
" => tagbar plugin
""""""""""""""""""""""""""""""""
nmap <silent><F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

""""""""""""""""""""""""""""""""
" => vim-airline
""""""""""""""""""""""""""""""""
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""""""""""""""""""
" => lookupfile
""""""""""""""""""""""""""""""""
"  script to generate filenametags
"  #!/bin/sh
"  # generate tag file for lookupfile plugin, use absolute path
"  echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
"  find `pwd` -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
"      sort -f >> filenametags 
"      
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0        "Don't save last pattern
let g:LookupFile_PreservePatternHistory = 1    "Save history
let g:LookupFile_AlwaysAcceptFirst = 1          "Enter to open 1st
let g:LookupFile_AllowNewFiles = 0              "Don't allow create file
if filereadable("./filenametags")               "Set name
    let g:LookupFile_TagExpr ='"./filenametags"'
endif

""""""""""""""""""""""""""""""""
" => ListToggle
""""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

""""""""""""""""""""""""""""""""
" => ShowMarks
""""""""""""""""""""""""""""""""
let g:showmarks_enable=0
" <leader>mt : Toggles ShowMarks on and off.
" <leader>mh : Hides an individual mark.
" <leader>ma : Hides all marks in the current buffer.
" <leader>mm : Places the next available mark.

""""""""""""""""""""""""""""""""
" => autopreview
""""""""""""""""""""""""""""""""
let g:AutoPreview_enabled = 0
"let g:EchoFuncKeyNext='<C-n>'
"let g:EchoFuncKeyPrev='<C-p>'
nmap <leader>a :AutoPreviewToggle<cr><C-j>

""""""""""""""""""""""""""""""
" Mark
""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

""""""""""""""""""""""""""""""""
" => autoload_cscope
""""""""""""""""""""""""""""""""
let g:autocscope_menus=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix
":cc 显示详细错误信息 ( :help :cc )
":cp 跳到上一个错误 ( :help :cp )
":cn 跳到下一个错误 ( :help :cn )
":cl 列出所有错误 ( :help :cl )
":cw 如果有错误列表，则打开quickfix窗口 ( :help :cw )
":col 到前一个旧的错误列表 ( :help :col )
":cnew 到后一个较新的错误列表 ( :help :cnew )
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
" To go to the next search result do:
"   <leader>n
" To go to the previous search results do:
"   <leader>p
nmap <leader>cc :botright cope<cr>
nmap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
nmap <leader>n :cn<cr>
nmap <leader>p :cp<cr>

" QuickFix 设置
" ---------------------------------------------------------
" command -bang -nargs=? QFix call QFixToggle1(<bang>0)
" function QFixToggle1(forced)
"   if exists("g:qfix_win") && a:forced == 0
"     cclose
"     unlet g:qfix_win
"   else
"     copen 10
"     let g:qfix_win = bufnr("$")
"   endif
" endfunction
" nmap <silent><F4> :QFix<CR>
" ---------------------------------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" => vim-markdown
""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1    " Highlight YAML frontmatter as used by Jekyll
let g:vim_markdown_math=1           " Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.


" => syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"suport c++11.
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'


""""""""""""""""""""""""""""""
" => OmniCompletion
""""""""""""""""""""""""""""""
" 全能(Omni)补全（代码）        CTRL-X CTRL-O
" 从上文查找补全                CTRL-P
" 从下文查找补全                CTRL-N
" 整行补全                      CTRL-X CTRL-L
" 根据当前文件里关键字补全      CTRL-X CTRL-N
" 根据字典补全                  CTRL-X CTRL-K
" 根据同义词字典补全            CTRL-X CTRL-T
" 根据头文件内关键字补全        CTRL-X CTRL-I
" 根据标签补全                  CTRL-X CTRL-]
" 补全文件名                    CTRL-X CTRL-F
" 补全宏定义                    CTRL-X CTRL-D
" 补全vim命令                   CTRL-X CTRL-V
" 用户自定义补全方式            CTRL-X CTRL-U
" 拼写建议                      CTRL-X CTRL-S
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascrÄ«ptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" -> OmniCppCompletion
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
set nocp
set infercase           "自动补全时区分大小写，默认不区分ignorecase
" Pmenu 是所有项的配色，PmenuSel 是选中项的配色，guibg 和 guifg 分别对应背景色和前景色。
" highlight Pmenu    guibg=darkgrey  guifg=black 
" highlight PmenuSel guibg=lightgrey guifg=black

""""""""""""""""""""""""""""""
" => xptemplate
""""""""""""""""""""""""""""""
let g:xptemplate_key='<c-\>'
let g:xptemplate_vars = "BRloop=\n"     "循环中的 { 重起一行
let g:xptemplate_vars = "BRfun= "       "函数中的 { 重起一行
" let g:xptemplate_brace_complete = '(['

" Prevent supertab from mapping <tab> to anything.
let g:SuperTabMappingForward = '<Plug>xpt_void'
" Tell XPTemplate what to fall back to, if nothing matches.
" Original SuperTab() yields nothing if g:SuperTabMappingForward was set to something it does not know.
let g:xptemplate_fallback = '<C-r>=XPTwrapSuperTab("n")<CR>'

fun! XPTwrapSuperTab(command) "{{{
    let v = SuperTab(a:command)
    if v == ''
        " Change \<Tab> to whatever you want, when neither XPTemplate or
        " supertab needs to do anything.
        return "\<Tab>"
    else
        return v
    end
endfunction "}}}

""""""""""""""""""""""""""""""
" => ultisnips
""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""
" => DoxygenToolkit
""""""""""""""""""""""""""""""
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="ovsoil"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
"let g:DoxygenToolkit_licenseTag="My own license"   "<-- !!! Does not end with "\<enter>"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"

""""""""""""""""""""""""""""""
" => SuperTab
""""""""""""""""""""""""""""""
if g:ycm==1
    let g:SuperTabDefaultCompletionType = "<c-tab>"
    let g:SuperTabContextDefaultCompletionType = "<c-tab>"
else
    let g:SuperTabDefaultCompletionType = "<c-n>"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
endif
let g:SuperTabRetainCompletionType = 2    "记住上次的补全方式

""""""""""""""""""""""""""""""
" => YCM
""""""""""""""""""""""""""""""
if g:ycm==1
    let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Development
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"execute project related configuration in current directory---------------------
if filereadable("workspace.vim")
    source workspace.vim  "set path+=...
endif

""""""""""""""""""""""""""""""
" => SrcExpl 与其他有冲突
""""""""""""""""""""""""""""""
" // The switch of the Source Explorer 
nmap <F8> :SrcExplToggle<CR> 
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
            \ "-MiniBufExplorer-",
            \ "__Tagbar__",
            \ "NERD_tree_1" 
            \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 0 
" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 
" // Set "<F3>" key for displaying the previous definition in the jump list 
"let g:SrcExpl_prevDefKey = "<F3>" 
" // Set "<F4>" key for displaying the next definition in the jump list 
"let g:SrcExpl_nextDefKey = "<F4>" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":ts 命令就能列出一个列表供用户选择。    
":tp 为上一个tag标记文件，
":tn 为下一个tag标记文件。当然,若当前tags文件中用户所查找的变量或函数名只有一个，“:tp,:tn”命令不可用。
"g+]直接显示ctag结果列表
"让CTRL-]只有一个选择时自动跳转，多个选择时，出现选择列表
"map <C-]> :tselect <C-R>=expand("<cword>")<CR><CR>
"map <C-]> g<C-]>

"自动加载tags---------------------------------------------------------------------
"添加特定的（已经生成tags）的函数库的tags
set tags+=~/.vim/src/cpp_src/tags
function! LoadTags()
    let db = findfile("tags", ".;")			"从当前目录往上找，直到找到 tags 这个命令能到找到tags的路径。
    if (!empty(db))
        execute "set tags+=".db
    endif
endfunction
"打开文件是自动加载
autocmd BufRead,BufEnter *.cpp,*.hpp call LoadTags()
"---------------------------------------------------------------------------------------

"一键更新tags---------------------------------------------------------------
"向上搜索tags文件，找到则更新，未找到就在当前目录下生成tags文件
"--c++-kinds=+p : 为标签添加函数原型(prototype)信息
"--fields=+iaS : 为标签添加继承信息(inheritance)，访问控制(access)信息，函数特征(function Signature,如参数表或原型等)
"--extra=+q : 为类成员标签添加类标识
map <F6> :call CreateTags()<CR>:! ls<CR><CR>
function! CreateTags()
    let db = findfile("tags", ".;")			"从当前目录往上找，直到找到tags文件，返回该路径
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/tags$"))
        if (empty(path))
            silent! execute "!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q ."
        endif
        if (!empty(path))
            silent! execute "!ctags -f ".path."/tags -R --c++-kinds=+px --fields=+iaS --extra=+q ".path
        endif
    endif
    if (empty(db))
        silent! execute "!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q ."
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"load_template设置
let g:template_path = "~/.vim/template/"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Cscope
"s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"d: 查找本函数调用的函数
"c: 查找调用本函数的函数
"t: 查找指定的字符串
"e: 查找egrep模式，相当于egrep功能，但查找速度快多了
"f: 查找并打开文件，类似vim的find功能
"i: 查找包含本文件的文
"
"查找cscope.out文件所在的目录，如果找到，在其目录下生成更新的cscope.out文件，如果找不到，就在当前目录下生成
"cscope.out和tags文件都在项目的根目录下，所以搜索到一个就能确定项目的根目录了
"--- 未实现，也没必要，cscope基本上只用于阅读代码，所以没有加此功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=cscope
    " Use both cscope and ctag
    set cscopetag
    " Show msg when cscope db added
    set cscopeverbose
    " Use cscope for definition search first
    set cscopetagorder=0
endif

"自动加载cscope.out
function! LoadCscope()
    let db = findfile("cscope.out", ".;")    "从当前目录往上找，直到找到 cscope.out 这个命令能到找到cscope.out的路径。
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocsverb                                "suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set csverb
    endif
endfunction
autocmd BufRead,BufEnter *.cpp,*.hpp call LoadCscope()

set cscopequickfix=s-,g-,c-,t-,e-,f-,i-,d-
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

"手动生成，更新cscope.out
" map <C-F6> :call Do_CsTag()<CR>
" function! Do_CsTag()
"     let dir = getcwd()
"     if filereadable("tags")
"         if(g:windows==1)
"             let tagsdeleted=delete(dir."\\"."tags")
"         else
"             let tagsdeleted=delete("./"."tags")
"         endif
"         if(tagsdeleted!=0)
"             echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
"             return
"         endif
"     endif
"     if has("cscope")
"         silent! execute "cs kill -1"
"     endif
"     if filereadable("cscope.files")
"         if(g:windows==1)
"             let csfilesdeleted=delete(dir."\\"."cscope.files")
"         else
"             let csfilesdeleted=delete("./"."cscope.files")
"         endif
"         if(csfilesdeleted!=0)
"             echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
"             return
"         endif
"     endif
"     if filereadable("cscope.out")
"         if(g:windows==1)
"             let csoutdeleted=delete(dir."\\"."cscope.out")
"         else
"             let csoutdeleted=delete("./"."cscope.out")
"         endif
"         if(csoutdeleted!=0)
"             echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
"             return
"         endif
"     endif
"     if(executable('ctags'))
"         "silent! execute "!ctags -R --c-types=+p --fields=+S *"
"         silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
"     endif
"     if(executable('cscope') && has("cscope") )
"         if(g:windows!=1)
"             silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
"         else
"             silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
"         endif
"         silent! execute "!cscope -b"
"         execute "normal :"
"         if filereadable("cscope.out")
"             execute "cs add cscope.out"
"         endif
"     endif
" endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"打开.h .hpp .H文件时自动加入防重复载入宏定义
function! s:insert_gates()
    "call TitleDet()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef _" . gatename . "_"
    execute "normal! o#define _" . gatename . "_"
    execute "normal! o"
    execute "normal! o"
    execute "normal! Go#endif // _" . gatename . "_"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp,H} call <SID>insert_gates()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "vim中直接添加文件的作者、时间信息、版本等
" nmap <C-F12> :call TitleDet() <CR>'s
" function! AddTitle()
" 	call append(0,"/**"
" 	call append(1,"* @file          ".expand("%:t"))
" 	call append(2,"* @brief         ovsoil")
" 	call append(3,"* @version       1.0")
" 	call append(4,"* @date          ".strftime("%Y-%m-%d %H:%M"))
" 	call append(5,"*/"
" 	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
" endfunction

" "更新最近修改时间和文件名
" function! UpdateTitle()
" 	normal m'
" 	execute '/Last modified/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
" 	normal ''
" 	normal mk
" 	execute '/Filename/s@:.*$@\=": ".expand("%:t")@'
" 	execute "noh"
" 	normal 'k
" 	echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
" endfunction

" "判断前10行代码里面，是否有Last modified这个单词
" "如果没有的话，就代表没有添加过作者信息，需要新添加
" "如果有的话，那么只需要更新即可
" function! TitleDet()
" 	let n = 1
" 	"默认为添加
" 	while n < 7
" 		let line = getline(n)
" 		if line =~ '^.*Last modified.*$'
" 			call UpdateTitle()
" 			return
" 		endif
" 		let n = n + 1
" 	endwhile
" 	call AddTitle()
" endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_macvim")
    colorscheme molokai
    "let g:solarized_termcolors=256 | colorscheme solarized
    "colorscheme desert
    "colorscheme evening
    "colorscheme badwolf
    "colorscheme koehler

    set transparency=20             "设置透明度macvim
    set guifont=Monaco:h12
    "set guifont=Courier_New:h14

    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


"""""""""""""""""""""""""""""""""""""""
" => 淘汰
"""""""""""""""""""""""""""""""""""""""
" 自定义状态栏，现已用vim-airline插件替代
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ [%p%%--%L]\ \ \ %=[FORMAT=%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ %Y-%y\ \ %{strftime(\"%d/%m/%y\")}        " Format the status line
"" Returns true if paste mode is enabled
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE '
"    en
"    return ''
"endfunction


" Don't close window, when deleting a buffer
" command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
"    let l:currentBufNum = bufnr("%")
"    let l:alternateBufNum = bufnr("#")
" 
"    if buflisted(l:alternateBufNum)
"      buffer #
"    else
"      bnext
"    endif
" 
"    if bufnr("%") == l:currentBufNum
"      new
"    endif
" 
"    if buflisted(l:currentBufNum)
"      execute("bdelete! ".l:currentBufNum)
"    endif
" endfunction


" function! CmdLine(str)
"     exe "menu Foo.Bar :" . a:str
"     emenu Foo.Bar
"     unmenu Foo
" endfunction

