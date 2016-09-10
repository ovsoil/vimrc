# Simple VIM Setting
## Screenshot
![simplevimseetingscreenshot](https://cloud.githubusercontent.com/assets/5633774/8563546/f99f3706-24f5-11e5-9451-5e33d7cc2652.png)

## Features
- Pathogen: easy to install plugins and runtime files
- Supertab: <tab> for all your insert completion needs
- Syntastic: external syntax checkers and displays any resulting errors
- Auto Pairs: insert or delete brackets, parens, quotes in pair
- Snipmate: provide support for textual snippets
- NERDTree: explore your file system and to open files and directories
- MiniBufferExplorer: list all open buffers as tabs
- Undotree: store the undo history
- Tag List: an overview of the structure of source code files: class, filed, method
- Vim-airline: provides statuslines and prompts
- Vim-colors-solarized: colorscheme versions for Vim
- Vim-fugitive: Integration with Git
- Code folding
- Show ALL white spaces as dot
- Return to last edit position when opening files
- Automatically insert file header when creating new files [*.cpp,*.[ch],*.sh,*.rb,*.java,*.py]
- Compile and execute


## Install
```
wget -qO- https://raw.githubusercontent.com/rarezhang/simple_vim_setting/master/install.sh | sh -x
```
## Uninstall
```
rm -rf ~/.vim ~/.vimrc
```

## VIM Tips
###1. Under normal mode
```
:wq             - save and quit
i               - insert
x VIM           - delete character
dd              - delete line, copied in clipboard
p               - paste
y               - copy
:help <command> - look up help doc
:?<pattern>     - search backward
:Explore        - file explore
```

###2. Code folding
inside a method and type ```‘za’``` to open and close a fold.

###3. Window splits
```
:e <filename>      - edit another file
:split <filename>  - Horizontal Split
:vsplit <filename> - vertical split
```

###4. Git
```
:Gwrite  - git add
:Gread   - git checkout
:Gremove - git rm
:Gmove   - git mv
:Gcommit - git commit
```

###5. Open undotree  /   NERDTree   /   taglist /  indent line
```
<,undo>
<,tree>
<,tag>
<,line>
```

###6. Snipmate
```
any reserved words + <tab>
e.g., def<tab>
```

###7. Copy and paste
- copy: <shift> + highlight the text + left mouse button
- paste: <shift> + right mouse button

###8. Search and replace the selected text
```
<,r>
```

###9. Go to the next / previous search result
```
<,n>
<,p>
```

###10. Execute script
```
<F5>
```

###11. Auto completion
```<C-Space>``` - Completion
```<leader>g``` - Goto assignments (typical goto function) 
```<leader>d``` - Goto definitions (follow identifier as far as possible, includes imports and statements) 
```K```- Show Documentation/Pydoc (shows a popup with assignments) 
```<leader>rname``` - Renaming
```<leader>n``` - Usages (shows all the usages of a name)
```:Pyimport <module name>``` - Open module, e.g. opens the `os` module :Pyimport os
B


Tips:

### 简单代码跳转

跳转到定义
gd到局部变量的定义，gD到全局变量的定义
搜索
*, # 可对光标处的词向前/向后做全词搜索，g*, g# 做相对应的非全词匹配搜索
代码块首尾
[[, ]] 可跳到当前代码块起始或结束的大括号处。
括号首尾
% 可在配对的括号、块首尾之前跳转。
位置历史
Ctrl-O 在历史记录中后台，Ctrl-I 则为前进。
