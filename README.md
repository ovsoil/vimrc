# vimrc
A powerful vim config file.
keymap similar with spacemacs

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
    cd
    git clone https://github.com/ovsoil/vimrc.git ~/repo/vimrc
    ln -s repo/vimrc/vimrc-dev ~/.vimrc
    ```
3. Open vim and it will continue the installation by itself. Wait for it to finish... and done! You now have your new shiny powerful vim :)


## screenshot:
## Features

a powerful vim config file, some of the keymap refer to spacemacs

### 1. Little but *usefull* features

* easy way to *search/replace/highlight/grep* current word & selected text
* easy way to motion in file
* easy to toggle help(<leader>hh), quickfix(<leader>q), Locate(<leader>l) windows
* nerdtree keymap similar to neotree in spacemacs;
* return to last edit position when opening files
* convenient to insert date/time/calculate at insert mode
* automatically jump to the last position of paste text
* good completion

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
    <leader>y       copy to clipboard
    <leader>d       delete to clipboard
    <leader>yy      copy current line to clipboard
    <leader>p       paste from clipboard
    <leader>P       paste before current cursor from clipboard

    # Edit
    <leader>=       format json file
    <leader>dm      delete all Windows ^M in file
    <leader>db      delete all lined blank space

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
