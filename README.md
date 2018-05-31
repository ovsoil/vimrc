# vimrc
A powerful vim config file for developer.
keymap similar with spacemacs

## Description

* `vimrc-dev`: vimrc for develop
* `vimrc-server`: Simple vimrc for server without any plugin

## Install | Upgrade

1. Prerequisites

    * vim compiled with python support. Check it with vim --version | grep +python ([neovim](https://neovim.io) is recommend)
    * Install the required dependencies:
    ```bash
    # mac
    brew install ctags
    brew install the_silver_searcher
    sudo pip install pep8 flake8 pyflakes isort yapf

    # ubuntu
    sudo apt-get install exuberant-ctags git ack-grep
    sudo apt-get install silversearcher-ag
    sudo pip install pep8 flake8 pyflakes isort yapf

    ```

    * If you are using [neovim](https://neovim.io), python neovim package is need.
    ```bash
    sudo pip install neovim
    ```
    * backup your old `.vimrc` file (`$HOME/.config/nvim/init.vim` for neovim ) and `.vim` folder, create an empty `.vim` folder

2. Clone this repo, and create a soft symbolic links which target the vimrc file which you want to use

    eg:

    ```bash
    git clone https://github.com/ovsoil/vimrc.git $HOME/repo/vimrc
    # vim
    ln -s $HOME/repo/vimrc/vimrc-dev $HOME/.vimrc
    # neovim
    ln -s $HOME/repo/vimrc/vimrc-dev $HOME/.config/nvim/init.vim

    ```
3. Open vim and it will continue the installation by itself. Wait for it to finish... and Done!
   You now have your new shiny powerful vim :)


## Features

a powerful vim config file, some of the keymap refer to spacemacs

### 1. *Usefull* small features

* easy to *search/replace/highlight/grep* current word & selected text
* support copy and paste with clipboard
* easy to motion in file
* good completion
* toggle windows: help(<leader>hh), quickfix(<leader>q), Locate(<leader>l)
* return to last edit position when opening files
* convenient to insert date/time/calculate at insert mode
* automatically jump to the last position of paste text

### 2.  Hot Plugins and spacemacs-like Keymap

* `:PlugStatus` to see which plugins included
* `:Maps` to see keymap list
* ...

### keymap

`<leader>` is `<Space>`, similar to spacemacs

    # Help
    <leader>hh      toggle help window (or <F1>)
    <leader>hk      search keymap
    ... more comming

    # Windows navigate
    <leader>wj      navigate to down window
    <leader>wk      navigate to up window
    <leader>wh      navigate to left window
    <leader>wl      navigate to right window

    # File open
    <leader>ff      find file at pwd dir
    <leader>fb      find in opened buffers
    <leader>fr      find in most recently files
    <leader>fe      find in the dir of current buffers
    <leader>ft      toggle neotree

    # Buffer navigate
    <leader>bb      find in opened buffers
    <leader>bn      next buffer
    <leader>bp      previous buffer
    <leader>bd      close the current buffer
    <leader>ba      close all buffers
    <leader>b<tab>  switch between most recently buffer
    <leader>bN      jump to buffer N, for single digit
    Ngb             jump to buffer N,

    # Search and replace
    <leader>ss      search string in all files at pwd dir (-i for case-insensitively, -s for case-sensitively)
    <leader>sw      search word at cursor or selected text in all files at pwd dir
    <leader>sr      search and replace seleted text (need confirm)
    <leader>sR      search and replace seleted text (not confirm)
    <leader>st      search tag in current file
    <leader>sT      search tag in all buffer
    <leader>sl      search line
    <leader>sc      search cmd

    # Jump
    <leader>jl      jump to line
    <leader>jw      jump to word

    # yank and paste
    <leader>pt      toggle paste mode
    <leader>yy      copy to clipboard
    <leader>dd      delete to clipboard
    <leader>yy      copy current line to clipboard
    <leader>pp      paste from clipboard
    <leader>pP      paste before current cursor from clipboard

    # cscope
    <leader>gs      Find this C symbol
    <leader>gg      Find this definition
    <leader>gd      Find functions called by this function
    <leader>gc      Find functions calling this function
    <leader>gt      Find this text string
    <leader>ge      Find this egrep pattern
    <leader>gf      Find this file
    <leader>gi      Find files #including this file
    <leader>ga      Find places where this symbol is assigned a value

    # Edit
    <leader>=       format json file
    <leader>dm      delete all Windows ^M in file
    <leader>db      delete all lined blank space

    # Insert Mode
    <c-d><c-d>      insert date
    <c-t><c-t>      insert time
    <c-c><c-c>      insert calculate

### auto completion

### snipmate

### git

## screenshot:


## Reference: Simple Vim Tutorial

### VIM的模式

- 命令模式 (Command Mode)
- 编辑模式 (Insert Mode)
- 可视模式 (View Mode)

### 基本移动

#### 以字为单位的移动

- `h` 向左移动一个字
- `j` 向下移动一行
- `k` 向上
- `l` 向右

#### 以词为单位的移动

- `w` 下一個word w(ord)
- `W` 下一個word(跳过标点)
- `b` 前一個word b(ackward)
- `B` 前一个word(跳过标点)
- `e` 跳到当前word的尾端 e(nd)

#### 行移动

- `0` 跳到当前行的开头
- `^` 跳到当前行第一个非空字符
- `$` 跳到行尾

助记：0(第0个字符),`^`和`$`含义同正则表达式

#### 段落移动
- `{` 上一段(以空白行分隔)
- `}` 下一段(以空白行分隔)
- `%` 跳到当前对应的括号上(适用各种配对符号)

#### 跳跃移动
- `/xxxx` 搜索xxxx，然后可以用`n`下一个，`N`上一个移动
- `#` 向前搜索光标当前所在的字
- `*` 向后搜索光标当前所在的字
- `fx` 在当前行移动到光标之后第一个字符x的位置 f(ind)x
- `gd` 跳到光标所在位置词(word)的定义位置 g(o)d(efine)
- `gg` 到文档顶部
- `G` 到文档底部
- `:x` 跳到第x行(x是行号)
- `ctrl+d` 向下翻页 d(down)
- `ctrl+u` 向上翻页 u(p)

### 基本编辑
#### 修改
- `i` 在光标当前位置向前插入 i(nsert)
- `I` 在本行第一个字符前插入
- `a` 在光标当前位置向后插入 a(fter)
- `A` 在本行末尾插入
- `o` 向下插入一行
- `O` 向上插入一行
- `:w` 保存
- `:q` 退出
- `:wq` 保存并退出

#### 删除
- `x` 删除当前字符
- `dd` 删除当前行 d(elete)
- `dw` 删除当前光标下的词 d(elete)w(ord)

#### 复制粘贴
- `yy` 复制当前行 y(ank)
- `yw` 复制当前光标下的词 y(ank)w(ord)
- `p` 粘贴 p(aste)
- `P` 粘贴在当前位置之前

### 进阶操作

仅介绍部分常用操作

#### 重复操作
因为VIM所有的操作都是原子化的，所以把这些操作程序化就非常简单了：

- `5w` 相当于按五次`w`键；
- `6j` 下移6行，相当于按六次j；
- `3J` 大写J,本来是将下一行与当前行合并，加上数量，就是重复操作3次；
- `6dw`和`d6w` 结果是一样，就是删除6个word；
- 类推其它

#### 高效编辑

- `di"` 光标在""之间，则删除""之间的内容
- `yi(` 光标在()之间，则复制()之间的内容
- `vi[` 光标在[]之间，则选中[]之间的内容
- 以上三种可以自由组合搭配，效率奇高，i(nner)
- `dtx` 删除字符直到遇见光标之后的第一个`x`字符
- `ytx` 复制字符直到遇见光标之后的第一个`x`字符

#### 标记和宏(macro)

- `ma` 将当前位置标记为a，26个字母均可做标记，`mb`、`mc`等等；
- `'a` 跳转到a标记的位置；
- 这是一组很好的文档内标记方法，在文档中跳跃编辑时很有用；
- `qa` 将之后的所有键盘操作录制下来，直到再次在命令模式按下`q`，并存储在`a`中；
- `@a` 执行刚刚记录在`a`里面的键盘操作；
- `@@` 执行上一次的macro操作；

例如下面一段宏可以复制当前含有数字的一行，并把数字递增。

    qa
    Y
    p
    <C-a>
    q

#### vimgrep

vimgrep用于匹配查找，基本的用法看下面的例子就大概明白了

`:vim /function demo/ *.c`          在当前目录的.c文件中，搜索function demo
`:vim /function demo/ **/*.c`       在任意目录的.c文件中，搜索function demo
`:vim /function demo/ **/*.{h,c}`   在任意目录的.c和.h文件中，搜索function demo
`:vim /\cfunction demo/ **/*.c`     使用\c，不区分大小写
`:vim /\Cfunction demo/ **/*.c`     使用\C，区分大小写
`:vim /function demo/j *.c`         只更新quickfix，不跳转到第一个搜索结果
`:vim /function demo/g *.c`         一行中若有多个匹配，每个都要单独显示一行

### other tips

`guu` – 把一行的文字变成全小写。或是【vu】
`gUU` – 把一行的文件变成全大写。或是【VU】
`ga` –  查看光标处字符的ascii码
`g8` – 查看光标处字符的utf-8编码
`gf`  – 打开光标处所指的文件 （这个命令在打到#include头文件时挺好用的，当然，仅限于有路径的）
`>>` 右给它进当前行 `<<` 向左缩进当前行
`=`  – 缩进当前行 （和上面不一样的是，它会对齐缩进）
`=%` – 把光标位置移到语句块的括号上，然后按=%，缩进整个语句块（%是括号匹配）
`G=gg` 或是 `gg=G`  – 缩进整个文件（G是到文件结尾，gg是到文件开头）
`Ctrl + O` 向后回退你的光标移动
`Ctrl + I` 向前追赶你的光标移动
`:r!date` 插入日期
`:g/^\n*$/d` 删除空行, 命令意义：正则匹配(行头+多个换行符+行尾)，d删除

