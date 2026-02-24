# CLAUDE.md

Project context for AI assistants working on this Neovim configuration.

## Project Overview

Native Lua Neovim configuration with Spacemacs-style keybindings. Plugin manager: lazy.nvim.

## Directory Structure

```
init.lua              -- Entry point: leader key, load config modules, bootstrap lazy.nvim
lua/
  config/
    options.lua       -- vim.opt settings (encoding, indent, search, UI, clipboard)
    keymaps.lua       -- Global keymaps (non-plugin)
    autocmds.lua      -- Autocommands (cursor restore, filetype indent, yank highlight)
  plugins/
    ui.lua            -- Colorscheme (gruvbox), statusline (lualine), indent guides, rainbow
    editor.lua        -- Comment, surround, autopairs, hop, zoom, text objects
    telescope.lua     -- Fuzzy finder and search
    grug-far.lua      -- Search & replace (ripgrep-based)
    coc.lua           -- LSP via coc.nvim (clangd, pyright)
    git.lua           -- Fugitive, gitsigns, blamer, diffview
    defx.lua          -- File explorer
    treesitter.lua    -- Treesitter
    coding.lua        -- Coding utilities
```

## Font Requirements

- Font: **Monaco for Powerline**
- Non-ASCII font: **Monaco for Powerline** (same)
- Powerline separator characters (U+E0B0–E0B3) are available and used in lualine
- **No Nerd Font icons** — this font does not include Nerd Font glyphs
- All plugin configs must disable Nerd Font icons and avoid Unicode symbols beyond basic/Powerline range
- Acceptable special characters: ASCII, basic Unicode box-drawing (│, ─), Powerline separators (U+E0B0–E0B3)

## Key Conventions

- Leader: `<Space>`
- Localleader: `<Space>`
- Keybinding pattern: `<leader><category><action>` (Spacemacs-style)
- Categories: `f` (file), `b` (buffer), `w` (window), `s` (search), `r` (replace), `t` (toggle), `h` (git hunk), `d` (diff), `l` (CocList), `p` (paste), `y` (yank)
- Plugin UI should be minimal: no unnecessary decorative icons or characters

## Plugin Patterns

- All plugins use lazy.nvim spec format in `lua/plugins/*.lua`
- Plugins are lazy-loaded where possible via `cmd`, `keys`, `event`
- lualine: `icons_enabled = false`, uses Powerline separators only
- grug-far: `icons.enabled = false`, `spinnerStates = false`
- diffview: uses simple ASCII/Unicode fold indicators (▸ / ▾)

## LSP

- Via coc.nvim (not native LSP)
- Configured servers: clangd, pyright
- Config file: `coc-settings.json`

## Search & Replace Architecture

- Search: Telescope (live_grep, grep_string, find_files)
- Replace: grug-far.nvim with ripgrep engine
- Legacy cdo-based replace has been fully removed
