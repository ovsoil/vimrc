# vimrc

Neovim / Vim 配置，采用 Spacemacs 风格快捷键。

## 配置文件

| 文件 | 编辑器 | 插件管理 | 用途 |
|------|--------|----------|------|
| `init.lua` | Neovim 0.10+ | lazy.nvim | 主力 Neovim 配置（Lua） |
| `vimrc-server` | Vim | 无 | 服务器极简配置（无插件） |

## 一键安装

```bash
git clone https://github.com/ovsoil/vimrc.git ~/Develop/vimrc
bash ~/Develop/vimrc/install.sh
```

脚本会自动完成以下工作：
- 安装系统依赖（neovim、node.js、python3、ripgrep、tree-sitter-cli 等）
- 软链接配置到 `~/.config/nvim`（已有配置自动备份）
- 安装所有插件并编译 treesitter 解析器
- 支持 macOS（Homebrew）和 Ubuntu（apt + PPA）
- GitHub 访问不畅时自动重试

## 手动安装

1. 安装依赖

    ```bash
    # macOS
    brew install neovim ripgrep node python3
    pip3 install pynvim
    npm install -g tree-sitter-cli

    # Ubuntu
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get install neovim ripgrep python3 python3-pip nodejs npm make gcc
    pip3 install pynvim
    sudo npm install -g tree-sitter-cli
    ```

2. 部署配置

    ```bash
    ln -sf ~/Develop/vimrc ~/.config/nvim
    ```

3. 打开 Neovim，lazy.nvim 会自动安装所有插件。

## 插件管理

```vim
:Lazy          " 打开插件管理界面
:Lazy sync     " 安装 / 更新 / 清理
:checkhealth   " 检查环境健康状态
```

## Leader 键

`<Space>` 为 Leader 键，大部分命令遵循 `<leader><分类><动作>` 模式。

## 快捷键参考

### 文件 (`<leader>f`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>ff` | n | 查找文件 |
| `<leader>fp` | n | Git 跟踪的文件 |
| `<leader>fx` | n | 查找文件（含忽略文件） |
| `<leader>fr` | n | 最近文件 |
| `<leader>fc` | n | 当前目录最近文件 |
| `<leader>fb` | n | 缓冲区列表 |
| `<leader>fl` | n | 当前缓冲区行搜索 |
| `<leader>fa` | n | 切换源文件/头文件（clangd） |
| `<leader>fj` | n | 在 Defx 中定位当前文件 |

### 缓冲区 (`<leader>b`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>bn` | n | 下一个缓冲区 |
| `<leader>bp` | n | 上一个缓冲区 |
| `<leader>bd` | n | 关闭缓冲区 |
| `<leader>b<tab>` | n | 切换到上一个缓冲区 |
| `<leader>bb` | n | 缓冲区列表 |

### 窗口 (`<leader>w`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>wh/j/k/l` | n, t | 窗口导航 |
| `<leader>ws` | n | 水平分屏 |
| `<leader>wv` | n | 垂直分屏 |
| `<C-w>m` | n | 切换窗口最大化 |

### 搜索 (`<leader>s`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>ss` | n | 实时搜索（rg） |
| `<leader>ss` | v | 搜索选中文本（可编辑） |
| `<leader>sa` | n | 搜索光标下的词 |
| `<leader>sa` | v | 搜索选中文本 |
| `<leader>sw` | n | 搜索光标下的词（全词匹配） |
| `<leader>sw` | v | 搜索选中文本 |
| `<leader>sp` | n | Git grep（交互式） |
| `<leader>st` | n | Treesitter 符号 |
| `<leader>sq` | n | Quickfix 列表 |
| `<leader>sc` | n | 命令历史 |
| `<leader>s/` | n | 搜索历史 |
| `<leader>sr` | n | LSP 引用 |
| `<leader>sd` | n | LSP 定义 |
| `<C-B>` | n | 在当前缓冲区搜索光标词 |
| `<C-F>` | n | 在项目中搜索光标词 |
| `gf` | v | 搜索选中文本 |
| `go` | n | 恢复上次搜索 |

### 替换 (`<leader>r`) — grug-far.nvim

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>rr` | n | 打开搜索替换（交互式） |
| `<leader>rw` | n | 替换光标词（全词匹配） |
| `<leader>rw` | v | 替换选中文本（全词匹配） |
| `<leader>ra` | n | 替换光标词（无边界） |
| `<leader>ra` | v | 替换选中文本（无边界） |
| `<leader>rW` | n | 替换光标下的 WORD |
| `<leader>rb` | n | 在当前文件中替换光标词 |
| `<leader>rb` | v | 在当前文件中替换选中文本 |

### 注释 (`<leader>c`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>cc` | n | 切换行注释 |
| `<leader>cc` | v | 切换选区注释 |
| `<leader>cb` | n | 切换块注释 |
| `<leader>cb` | v | 切换选区块注释 |
| `<leader>cA` | n | 在行尾追加注释 |
| `<leader>co` | n | 在下方插入注释行 |
| `<leader>cO` | n | 在上方插入注释行 |
| `gcc` | n | 切换行注释 |
| `gc` | n, v | 切换注释 |
| `gbc` | n | 切换块注释 |

### 开关 (`<leader>t`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>tf` / `<F2>` | n | 切换 Defx 文件浏览器 |
| `<leader>ts` | n | 恢复上次搜索 |
| `<leader>tq` | n | 切换 Quickfix 窗口 |
| `<leader>tb` | n | 切换 Git blame |
| `<leader>tl` | n | 恢复 CocList |
| `<leader>td` | n | 切换 Diffview 文件面板 |
| `<leader>tc` | n | 切换自动 clang-format |

### Git (`<leader>h` / `<leader>d`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>hs` | n, v | 暂存 hunk |
| `<leader>hr` | n, v | 重置 hunk |
| `<leader>hu` | n | 撤销暂存 hunk |
| `<leader>hp` | n | 预览 hunk |
| `<leader>hd` | n | Diff 当前文件 |
| `<leader>dv` | n | 打开 Diffview |
| `<leader>dh` | n | 文件历史 |
| `<leader>dc` | n | 关闭 Diffview |
| `]c` / `[c` | n | 下一个 / 上一个 hunk |

### LSP / 代码 (coc.nvim)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `gd` | n | 跳转到定义 |
| `gr` | n | 查找引用 |
| `gy` | n | 跳转到类型定义 |
| `gi` | n | 跳转到实现 |
| `K` | n | 显示文档 |
| `<leader>rn` | n | 重命名符号 |
| `<leader>f` | n, x | 格式化选区 |
| `<leader>a` | n, x | 代码动作（选区） |
| `<leader>ac` | n | 代码动作 |
| `<leader>qf` | n | 快速修复 |
| `[g` / `]g` | n | 上一个 / 下一个诊断 |

### CocList (`<leader>l`)

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>la` | n | 诊断列表 |
| `<leader>le` | n | 扩展列表 |
| `<leader>lc` | n | 命令列表 |
| `<leader>lo` | n | 大纲 |
| `<leader>lT` | n | 符号 |
| `<leader>lj` / `<leader>lk` | n | 下一个 / 上一个项目 |

### 编辑

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>db` | n | 删除行尾空白 |
| `<leader>dm` | n | 删除 Windows ^M 字符 |
| `<leader>y` | n, v | 复制到系统剪贴板 |
| `<leader>yy` | n | 复制整行到剪贴板 |
| `<leader>pp` | n, v | 从剪贴板粘贴 |
| `<leader>pP` | n, v | 从剪贴板粘贴到光标前 |
| `<leader>p` | n, v | 从 yank 寄存器粘贴 |

### 快捷操作

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader>q` | n | 关闭窗口 |
| `<leader>qq` | n | 全部退出 |
| `<leader>x` | n | 保存 |
| `<leader>xx` | n | 全部保存 |
| `<leader>xq` | n | 保存并退出 |
| `<leader><CR>` | n | 清除搜索高亮 |
| `<leader>zz` | n | 切换全部折叠 |
| `<leader>rv` | n | 重新加载配置 |
| `;` | n | 进入命令模式 |
| `<leader><tab>` | n | 显示快捷键列表 |

### 插入模式

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<C-d><C-d>` | i | 插入日期 |
| `<C-t><C-t>` | i | 插入时间 |
| `<C-c><C-c>` | i | 计算表达式 |

### 移动

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `<leader><leader>w` | n | Hop 跳转到词 |
| `<leader><leader>f` | n | Hop 跳转到字符 |
| `<leader><leader>j` | n | Hop 向下跳行 |
| `<leader><leader>k` | n | Hop 向上跳行 |
| `<leader><leader>h` | n | Hop 行内向左 |
| `<leader><leader>l` | n | Hop 行内向右 |
| `H` / `L` | n | 行首 / 行尾 |

## Defx 快捷键（缓冲区内）

| 按键 | 说明 |
|------|------|
| `h` / `l` | 向上导航 / 打开 |
| `o` | 切换树展开 |
| `E` | 垂直分屏打开 |
| `K` / `N` | 新建目录 / 文件 |
| `d` / `r` | 删除 / 重命名 |
| `yy` | 复制路径 |
| `P` | 预览 |
| `x` | 执行系统命令 |
| `.` | 切换隐藏文件 |
| `u` | 进入上级目录 |

## 依赖

必需：
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rg) — 搜索后端
- [Node.js](https://nodejs.org) — coc.nvim 需要
- Python3 + pynvim — defx.nvim 需要
- tree-sitter-cli — treesitter 解析器编译需要

可选：
- `clangd` — C/C++ 语言服务器
- `pyright` — Python 语言服务器
- `glow` — Markdown 终端预览
