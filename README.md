# My vimrc

The `vimrc-lite` is for base use.

## Install

1. Get vimrc and put it in your home directory.
    
    * Linux/Unix
    ```bash 
         git clone https://github.com/ovsoil/vimrc.git
         cp vimrc/vimrc ~/.vimrc  or   cp vimrc/vimrc-lite ~/.vimrc
     ```
    * Windows
     
    download or clone this vimrc;
    copy the file `vimrc` or `vimrc-lite` to Your Vim Path, and rename it with `_vimrc`;

2. Install Vundle in you .vim directory.
    
    * Linux/Unix
   ```bash 
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```
   * Windows
   
   ```bash 
        git clone https://github.com/VundleVim/Vundle.vim.git $VIM/vimfiles/bundle/Vundle.vim
   ```

3. Install Plugin.
    
    Launch `vim` and run `:PluginInstall`.
