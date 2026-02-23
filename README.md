# vimrc
A powerful vim config file for developer.
keymap similar with spacemacs

## Description

Four configuration files serve different use cases:

| File | Editor | Plugin Manager | Use Case |
|------|--------|---------------|----------|
| `init.vim` | Neovim | dein.vim | Legacy Neovim config |
| `vimrc-dev` | Vim 8+ | vim-plug | Vim config |
| `vimrc-server` | Vim | None | Minimal config for servers (no plugins) |

## Install | Upgrade

1. Prerequisites

    * [Neovim](https://neovim.io) (recommended) or Vim 8+
    * System dependencies:
    ```bash
    # Ubuntu/Debian
    sudo apt-get install exuberant-ctags git ripgrep silversearcher-ag fzf

    # macOS
    brew install ctags ripgrep ag fzf
    ```

    * For Neovim Python support:
    ```bash
    pip install pynvim
    ```

2. Clone this repo, and create a soft symbolic links which target the vimrc file which you want to use

    ```bash
    git clone https://github.com/ovsoil/vimrc.git $HOME/repo/vimrc
    # neovim with dein.vim (legacy)
    ln -s $HOME/repo/vimrc/init.vim $HOME/.config/nvim/init.vim
    # vim 8+
    ln -s $HOME/repo/vimrc/vimrc-dev $HOME/.vimrc
    ```

3. Open Neovim/Vim and it will continue the installation by itself. Wait for it to finish... and Done!

## Plugin Management

### init.vim (dein.vim - Neovim)

```vim
:call dein#install()      " Install missing plugins
:call dein#update()       " Update all plugins
:call dein#check_clean()  " Remove unused plugins
:DeinUpdate               " Update via UI
```

### vimrc-dev (vim-plug - Vim)

```vim
:PlugInstall              " Install plugins
:PlugUpdate               " Update plugins
:PlugClean                " Remove unused plugins
```

## Features

A powerful vim config file with Spacemacs-like keybindings.

### Key Features

* Easy search/replace/highlight with multiple backends (LeaderF rg, fzf, git grep)
* Clipboard support with OSC yank
* Multiple file explorers (Defx, fzf)
* LSP support via coc.nvim (clangd, pyright)
* Git integration (fugitive, signify)
* Markdown rendering
* Rainbow parentheses
* Blame info display
* Quickfix toggle

### Leader Key

`<Space>` is the leader key (Spacemacs-style). Most commands follow the pattern `<leader><category><action>`.

## Keymap Reference

### File Operations (`<leader>f`)

| Mapping | Description |
|---------|-------------|
| `<leader>ff` | Find files |
| `<leader>fp` | Git tracked files |
| `<leader>fr` | Recent files |
| `<leader>fb` | Buffers |
| `<leader>fa` | clangd.switchSourceHeader |
| `<leader>fj` | expand current file in Defx |

### Buffer Operations (`<leader>b`)

| Mapping | Description |
|---------|-------------|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Delete buffer |
| `<leader>b<tab>` | Switch to last buffer |
| `<leader>bb` | Buffer list (LeaderF) |

### Window Navigation (`<leader>w`)

| Mapping | Description |
|---------|-------------|
| `<leader>wj` | Navigate to down window |
| `<leader>wk` | Navigate to up window |
| `<leader>wh` | Navigate to left window |
| `<leader>wl` | Navigate to right window |
| `<leader>ws` | Split window |
| `<leader>wv` | Vertical split |

### Search (`<leader>s`)

| Mapping | Description |
|---------|-------------|
| `<leader>ss` | Search with rg, include hide file; set the search command in vim command line, wait user to input the search text|
| `<leader>sw` | Search word under cursor |
| `<leader>sp` | Git grep (fzf Ggrep) |
| `<leader>st` | Buffer tags (BTags) |
| `<leader>sc` | Command history |
| `<leader>sr` | Gtags reverse search |
| `<leader>sd` | Gtags definition |

### Toggle (`<leader>t`)

| Mapping | Description |
|---------|-------------|
| `<leader>tf` | Toggle file explorer (Defx) , and expand to current file|
| `<leader>ts` | Recall the last search or show the last search result |
| `<leader>tq` | Toggle quickfix window |
| `<leader>tb` | Toggle git blame (Blamer) |
### Replace (`<leader>r`)

| Mapping | Description |
|---------|-------------|
| `<leader>rb` | Replace in buffer (with confirm) |
| `<leader>rB` | Replace in buffer (no confirm) |
| `<leader>rr` | Replace in project (git grep, with confirm) |
| `<leader>rR` | Replace in project (no confirm) |
| `<leader>rf` | Replace in directory (LeaderF rg, with confirm) |
| `<leader>rF` | Replace in directory (no confirm) |

### Git/Cscope (`<leader>g`)

| Mapping | Description |
|---------|-------------|
| `<leader>gs` | Find C symbol |
| `<leader>gg` | Find definition |
| `<leader>gd` | Functions called by this |
| `<leader>gc` | Functions calling this |
| `<leader>gt` | Find text string |
| `<leader>ge` | Egrep pattern |
| `<leader>gf` | Find this file |
| `<leader>gi` | Files including this file |
| `<leader>ga` | Find assignment |

### LSP/Code (coc.nvim)

| Mapping | Description |
|---------|-------------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `K` | Show documentation |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format selected (visual mode) |
| `<leader>ac` | Code action |
| `<leader>qf` | Quick fix |

### Edit

| Mapping | Description |
|---------|-------------|
| `<leader>db` | Delete trailing whitespace |
| `<leader>dm` | Delete Windows ^M |
| `<leader>pt` | Toggle paste mode |
| `<leader>y` | OSC yank operator |
| `<leader>yy` | Yank line |
| `<leader>pp` | Paste from clipboard |

### Insert Mode

| Mapping | Description |
|---------|-------------|
| `<C-d><C-d>` | Insert date |
| `<C-t><C-t>` | Insert time |
| `<C-c><C-c>` | Calculate expression |

### Quick Actions

| Mapping | Description |
|---------|-------------|
| `<leader>q` | Close buffer |
| `<leader>qq` | Quit all |
| `<leader>x` | Save |
| `<leader>xx` | Save all |
| `<leader>xq` | Save and quit all |
| `<leader>rv` | Reload vimrc |
| `<leader><cr>` | Clear search highlight |

## Defx Keymap (File Explorer)

| Key | Description |
|-----|-------------|
| `h/l` | Navigate up/open directory |
| `E` | Open in vertical split |
| `K/N` | Create directory/file |
| `d/r` | Delete/rename |
| `yy` | Yank path |
| `o` | Toggle tree |
| `p` | Preview |
| `x` | Execute system command |

## Dependencies

Required tools:

* `ripgrep` (rg) - Search tool
* `ag` (the_silver_searcher) - Alternative search
* `ctags` - Tag generation
* `fzf` - Fuzzy finder
* `clangd` - C/C++ language server (at `/bin/clangd-18`)
* `global` (gtags) - GNU global (optional)

Optional tools:

* `glow` - Markdown preview

## LSP Configuration

LSP servers are configured in `coc-settings.json`:
- **clangd** for C/C++ at `/bin/clangd-18`
- **pyright** for Python

## Custom Functions

* `LoadCscope()` - Auto-loads cscope.out for C++/Go
* `GgrepReplace()` - Project-wide replace using git grep
* `LeaderRgReplace()` - Project-wide replace using LeaderF rg
* `ToggleQuickFix()` - Toggle quickfix window
* `GlowPreview()` - Markdown preview using glow
* `ToggleFold()` - Toggle code folding
