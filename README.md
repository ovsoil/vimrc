# vimrc
a powerful vim config file, the key map refer to spacemacs

still being imaturing...

## Description

* `vimrc-server`: Simple vimrc for server without any plugin
* `vimrc-dev`: vimrc for develop

## Install | Upgrade

1. Prerequisites

    * vim compiled with python support. Check it with vim --version | grep +python
    * Install the required dependencies:
    ```bash
    # ubuntu
    sudo apt-get install exuberant-ctags git ack-grep
    sudo apt-get install silversearcher-ag
    sudo pip install pep8 flake8 pyflakes isort yapf

    # mac
    brew install ctags
    brew install the_silver_searcher
    sudo pip install pep8 flake8 pyflakes isort yapf
    ```
    * backup your old .vimrc file and .vim folder, create an empty .vim folder

2. Clone this repo, and create a soft symbolic links `~/.vimrc` target the vimrc file which you want to use

    eg:

    ```bash
    git clone https://github.com/ovsoil/vimrc.git ~/repo/vimrc
    ln -s repo/vimrc/vimrc-dev ~/.vimrc
    ```
3. Open vim and it will continue the installation by itself. Wait for it to finish... and done! You now have your new shiny powerful vim :)


## screenshot:
## Features
    
a powerful vim config file, some of the keymap refer to spacemacs

### 1.  Include the Hot Plugins

* vim-plug: easy to install plugins and runtime files
* syntastic: external syntax checkers and displays any resulting errors
* nerdtree: explore your file system and to open files and directories
* vim-airline: provides statuslines and prompts
* ...

### 2. Little but *usefull* features

* easy way to *search/replace/highlight/grep* current word & selected text
* good completion
* toggle help window by one key
* nerdtree keymap similar to neotree in emacs;
* return to last edit position when opening files
* convenient to inset date/time/calculate

### keymap

`<leader>` is `<Space>`, similar to spacemacs

    # Help
    <leader>hh      toggle help window (or <F1>)
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
    <leader>ft      find tag at pwd dir

    # Buffer navigate
    <leader>bb      find in opened buffers
    <leader>bn      next buffer
    <leader>bp      previous buffer
    <leader>bd      close the current buffer
    <leader>ba      close all buffers
    <leader>b<tab>  switch between most recently buffer
    <leader>bN      jump to buffer N, for single digit
    Ngb             jump to buffer N, 

    # Search word/tag
    <leader>ss      search string in all files at pwd dir (-i for case-insensitively, -s for case-sensitively)
    <leader>sw      search word at cursor or selected text in all files at pwd dir
    <leader>st      search tag in current file
    <leader>sT      search tag in all buffer
    <leader>sl      search line
    <leader>sc      search cmd
    <leader>sk      search keymap

    # Jump
    <leader>jl      jump to line
    <leader>jw      jump to word

    # Edit
    <leader>pp      toggle paste mode
    <leader>=       format json file
    <leader>dm      delete the Windows ^M in file
    <leader>db      delete blank space in linend

    # Insert Mode
    <c-d><c-d>      insert date
    <c-t><c-t>      insert time
    <c-c><c-c>      insert calculate

## Tips

### general

### search and replace

### copy and paste

### navigate

### git

### auto completion

### snipmate
