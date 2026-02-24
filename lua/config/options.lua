local opt = vim.opt

-- System detection
vim.g.system = "unix"
if vim.fn.has("win32") == 1 then
  vim.g.system = "windows"
elseif vim.fn.has("unix") == 1 then
  if vim.fn.system("uname"):match("Darwin") then
    vim.g.system = "mac"
  end
end

-- Disable unused providers (coc.nvim/markdown-preview use their own node process)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Python provider
if vim.g.system == "mac" then
  vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/shims/python3")
else
  vim.g.python3_host_prog = "/usr/bin/python3"
end

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Base
opt.autoread = true
opt.shortmess:append("atIc")
opt.magic = true
opt.title = true
opt.backup = false
opt.writebackup = false
opt.visualbell = false
opt.errorbells = false
opt.timeoutlen = 500
opt.history = 1000

-- Movement
opt.scrolloff = 7

-- UI
-- "linux" TERM = raw Linux virtual console, no 24-bit color
if vim.env.TERM ~= "linux" then
  opt.termguicolors = true
end
opt.ruler = true
opt.number = true
opt.wrap = true
opt.showcmd = true
opt.showmode = true
opt.showmatch = true
opt.matchtime = 2
opt.hidden = true
opt.updatetime = 250
opt.signcolumn = "auto"
opt.cursorline = true
opt.laststatus = 2
opt.pumblend = 15
opt.pumheight = 15

-- Tab/Indent
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Select & Complete
opt.selection = "inclusive"
opt.selectmode = "mouse,key"
opt.completeopt = "longest,menu"
opt.wildmenu = true
opt.wildmode = "longest,list,full"
opt.wildignore:append("*.o,*~,*.pyc,*.class,*.swp,*.bak,.svn")

-- Others
opt.backspace = "indent,eol,start"
opt.whichwrap:append("<,>,h,l")
opt.mouse = ""

-- Fold
opt.foldenable = true
opt.foldmethod = "indent"
opt.foldlevel = 99

-- Background
opt.background = "dark"

-- Grep
if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case"
  opt.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ag") == 1 then
  opt.grepprg = "ag --nogroup --nocolor"
end

-- JSON/Markdown conceal
vim.g.vim_json_conceal = 0
vim.g.markdown_syntax_conceal = 0

-- OSC 52 clipboard (native since nvim 0.10)
if vim.fn.has("nvim-0.10") == 1 then
  local ok, osc52 = pcall(function()
    return require("vim.ui.clipboard.osc52")
  end)
  if ok then
    vim.g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = osc52.copy("+"),
        ["*"] = osc52.copy("*"),
      },
      paste = {
        ["+"] = osc52.paste("+"),
        ["*"] = osc52.paste("*"),
      },
    }
  end
end
