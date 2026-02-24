# vimrc

A powerful Neovim / Vim config with Spacemacs-like keybindings.

## Configurations

| File | Editor | Plugin Manager | Use Case |
|------|--------|---------------|----------|
| `init.lua` | Neovim 0.10+ | lazy.nvim | Primary Neovim config (Lua) |
| `init.vim` | Neovim | dein.vim | Legacy Neovim config |
| `vimrc-dev` | Vim 8+ | vim-plug | Vim config |
| `vimrc-server` | Vim | None | Minimal config for servers (no plugins) |

## Install

1. Prerequisites

    ```bash
    # macOS
    brew install neovim ripgrep fzf

    # Ubuntu/Debian
    sudo apt-get install neovim ripgrep fzf
    ```

2. Clone and link

    ```bash
    git clone https://github.com/ovsoil/vimrc.git ~/repo/vimrc
    ln -s ~/repo/vimrc ~/.config/nvim
    ```

3. Open Neovim — lazy.nvim will auto-install all plugins.

## Plugin Management (lazy.nvim)

```vim
:Lazy          " Open lazy.nvim UI
:Lazy sync     " Install / update / clean
```

## Leader Key

`<Space>` is the leader key. Most commands follow `<leader><category><action>`.

## Keymap Reference

### File (`<leader>f`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>ff` | n | Find files |
| `<leader>fp` | n | Git tracked files |
| `<leader>fx` | n | Find files (no ignore) |
| `<leader>fr` | n | Recent files |
| `<leader>fc` | n | MRU (cwd only) |
| `<leader>fb` | n | Buffers |
| `<leader>fl` | n | Buffer lines (fuzzy) |
| `<leader>fa` | n | Switch source/header (clangd) |
| `<leader>fj` | n | Reveal current file in Defx |

### Buffer (`<leader>b`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>bn` | n | Next buffer |
| `<leader>bp` | n | Previous buffer |
| `<leader>bd` | n | Delete buffer |
| `<leader>b<tab>` | n | Switch to last buffer |
| `<leader>bb` | n | Buffer list |

### Window (`<leader>w`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>wh/j/k/l` | n, t | Navigate windows |
| `<leader>ws` | n | Horizontal split |
| `<leader>wv` | n | Vertical split |
| `<C-w>m` | n | Toggle zoom |

### Search (`<leader>s`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>ss` | n | Live grep (rg) |
| `<leader>ss` | v | Live grep with selection (editable) |
| `<leader>sa` | n | Grep cword |
| `<leader>sa` | v | Grep selection |
| `<leader>sw` | n | Grep cword (word boundary) |
| `<leader>sw` | v | Grep selection |
| `<leader>sp` | n | Git grep (interactive) |
| `<leader>st` | n | Treesitter symbols |
| `<leader>sq` | n | Quickfix list |
| `<leader>sc` | n | Command history |
| `<leader>s/` | n | Search history |
| `<leader>sr` | n | LSP references |
| `<leader>sd` | n | LSP definitions |
| `<C-B>` | n | Grep cword in buffer |
| `<C-F>` | n | Grep cword in project |
| `gf` | v | Grep visual selection |
| `go` | n | Resume last search |

### Replace (`<leader>r`) — grug-far.nvim

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>rr` | n | Open search & replace (interactive) |
| `<leader>rw` | n | Replace word (cword + word boundary) |
| `<leader>rw` | v | Replace selection (word boundary) |
| `<leader>ra` | n | Replace text (cword, no boundary) |
| `<leader>ra` | v | Replace selection (no boundary) |
| `<leader>rW` | n | Replace cWORD (whitespace-delimited) |
| `<leader>rb` | n | Replace cword in current file |
| `<leader>rb` | v | Replace selection in current file |
| `<leader>rv` | n | Reload vimrc |

grug-far buffer keymaps (localleader = `<Space>`):

| Mapping | Description |
|---------|-------------|
| `<localleader>r` | Execute replace |
| `<localleader>q` | Send to quickfix |
| `<localleader>s` | Sync all locations |
| `<localleader>l` | Sync current line |
| `<localleader>f` | Refresh |
| `<localleader>t` | Open history |
| `<localleader>e` | Swap engine |
| `<localleader>p` | Toggle show command |
| `<enter>` | Goto location |
| `q` / `<Esc>` | Close |

### Toggle (`<leader>t`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>tf` / `<F2>` | n | Toggle Defx file explorer |
| `<leader>ts` | n | Resume last search |
| `<leader>tq` | n | Toggle quickfix window |
| `<leader>tb` | n | Toggle git blame |
| `<leader>tl` | n | Resume CocList |
| `<leader>td` | n | Toggle diffview files panel |

### Git (`<leader>h` / `<leader>d`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>hs` | n, v | Stage hunk |
| `<leader>hr` | n, v | Reset hunk |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hd` | n | Diff this |
| `<leader>dv` | n | Diffview open |
| `<leader>dh` | n | File history |
| `<leader>dc` | n | Diffview close |
| `]c` / `[c` | n | Next / prev hunk |

### LSP / Code (coc.nvim)

| Mapping | Mode | Description |
|---------|------|-------------|
| `gd` | n | Go to definition |
| `gr` | n | Find references |
| `gy` | n | Go to type definition |
| `gi` | n | Go to implementation |
| `K` | n | Show documentation |
| `<leader>rn` | n | Rename symbol |
| `<leader>f` | n, x | Format selected |
| `<leader>a` | n, x | Code action (selected) |
| `<leader>ac` | n | Code action |
| `<leader>qf` | n | Quick fix |
| `[g` / `]g` | n | Prev / next diagnostic |

### CocList (`<leader>l`)

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>la` | n | Diagnostics |
| `<leader>le` | n | Extensions |
| `<leader>lc` | n | Commands |
| `<leader>lo` | n | Outline |
| `<leader>lT` | n | Symbols |
| `<leader>lj` / `<leader>lk` | n | Next / prev item |

### Edit

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>db` | n | Delete trailing whitespace |
| `<leader>dm` | n | Delete Windows ^M |
| `<leader>y` | n, v | Yank to system clipboard |
| `<leader>yy` | n | Yank line to clipboard |
| `<leader>pp` | n, v | Paste from clipboard |
| `<leader>pP` | n, v | Paste before from clipboard |
| `<leader>p` | n, v | Paste from yank register |

### Quick Actions

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader>q` | n | Close window |
| `<leader>qq` | n | Quit all |
| `<leader>x` | n | Save |
| `<leader>xx` | n | Save all |
| `<leader>xq` | n | Save and quit all |
| `<leader><CR>` | n | Clear search highlight |
| `<leader>zz` | n | Toggle fold all |
| `;` | n | Enter command mode |
| `<leader><tab>` | n | Show keymaps |

### Insert Mode

| Mapping | Mode | Description |
|---------|------|-------------|
| `<C-d><C-d>` | i | Insert date |
| `<C-t><C-t>` | i | Insert time |
| `<C-c><C-c>` | i | Calculate expression |

### Movement

| Mapping | Mode | Description |
|---------|------|-------------|
| `<leader><leader>w` | n | Hop word |
| `<leader><leader>f` | n | Hop char |
| `<leader><leader>j` | n | Hop line down |
| `<leader><leader>k` | n | Hop line up |
| `<leader><leader>h` | n | Hop line backward |
| `<leader><leader>l` | n | Hop line forward |
| `H` / `L` | n | Line start / end |

## Defx Keymaps (buffer-local)

| Key | Description |
|-----|-------------|
| `h` / `l` | Navigate up / open |
| `o` | Toggle tree |
| `E` | Open in vsplit |
| `K` / `N` | Create directory / file |
| `d` / `r` | Delete / rename |
| `yy` | Yank path |
| `P` | Preview |
| `x` | Execute system command |
| `.` | Toggle hidden files |
| `u` | Go to parent directory |

## Dependencies

Required:
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rg) — search backend
- [Node.js](https://nodejs.org) — for coc.nvim

Optional:
- `clangd` — C/C++ language server
- `glow` — Markdown preview
