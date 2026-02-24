# CLAUDE.md

AI 助手在本 Neovim 配置项目中的工作上下文。

## 项目概述

原生 Lua Neovim 配置，采用 Spacemacs 风格快捷键。插件管理器：lazy.nvim。

## 语言约定

- 文档文件（README.md、CLAUDE.md 等）使用**中文**
- 代码注释和脚本注释使用**英文**

## 目录结构

```
init.lua              -- 入口：leader 键、加载配置模块、引导 lazy.nvim
install.sh            -- 一键安装脚本（macOS / Ubuntu）
vimrc-server          -- 独立的极简 vim 配置（无插件）
lua/
  config/
    options.lua       -- vim.opt 设置（编码、缩进、搜索、UI、剪贴板）
    keymaps.lua       -- 全局快捷键（非插件）
    autocmds.lua      -- 自动命令（光标恢复、文件类型缩进、复制高亮）
  plugins/
    ui.lua            -- 配色（gruvbox）、状态栏（lualine）、缩进线
    editor.lua        -- 注释、surround、自动括号、hop、zoom、缩进文本对象
    telescope.lua     -- 模糊搜索
    grug-far.lua      -- 搜索替换（基于 ripgrep）
    coc.lua           -- LSP（coc.nvim：clangd、pyright）
    git.lua           -- Fugitive、gitsigns、blamer、diffview
    defx.lua          -- 文件浏览器
    treesitter.lua    -- Treesitter
    coding.lua        -- Clang-format、Markdown 预览
```

## 字体要求

- 字体：**Monaco for Powerline**
- 非 ASCII 字体：**Monaco for Powerline**（同上）
- Powerline 分隔符（U+E0B0–E0B3）可用，用于 lualine
- **无 Nerd Font 图标** — 此字体不含 Nerd Font 字形
- 所有插件配置必须禁用 Nerd Font 图标，避免使用基本/Powerline 范围外的 Unicode 符号
- 可接受的特殊字符：ASCII、基础 Unicode 制表符（│、─）、Powerline 分隔符（U+E0B0–E0B3）

## 快捷键约定

- Leader：`<Space>`
- Localleader：`<Space>`
- 快捷键模式：`<leader><分类><动作>`（Spacemacs 风格）
- 分类：`f`（文件）、`b`（缓冲区）、`w`（窗口）、`s`（搜索）、`r`（替换）、`c`（注释）、`t`（开关）、`h`（git hunk）、`d`（diff）、`l`（CocList）、`p`（粘贴）、`y`（复制）
- 插件 UI 保持简洁：无不必要的装饰图标或字符

## 插件模式

- 所有插件使用 lazy.nvim spec 格式，位于 `lua/plugins/*.lua`
- 尽可能通过 `cmd`、`keys`、`event` 延迟加载
- lualine：`icons_enabled = false`，仅使用 Powerline 分隔符
- grug-far：`icons.enabled = false`、`spinnerStates = false`
- diffview：使用简单 ASCII/Unicode 折叠指示符（▸ / ▾）

## LSP

- 通过 coc.nvim（非原生 LSP）
- 已配置的语言服务器：clangd、pyright
- 配置文件：`coc-settings.json`

## 搜索替换架构

- 搜索：Telescope（live_grep、grep_string、find_files）
- 替换：grug-far.nvim + ripgrep 引擎
