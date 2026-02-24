local function get_visual_selection()
  local _, ls, cs = unpack(vim.fn.getpos("v"))
  local _, le, ce = unpack(vim.fn.getpos("."))
  if ls > le or (ls == le and cs > ce) then
    ls, cs, le, ce = le, ce, ls, cs
  end
  local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)
  if #lines == 0 then return "" end
  lines[#lines] = lines[#lines]:sub(1, ce)
  lines[1] = lines[1]:sub(cs)
  return table.concat(lines, "\n")
end

local function goto_replace_on_open()
  local group = vim.api.nvim_create_augroup("grug_far_goto_replace", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "grug-far",
    once = true,
    callback = function(ev)
      vim.defer_fn(function()
        local ok, instance = pcall(require("grug-far").get_instance, ev.buf)
        if ok and instance then instance:goto_input("replacement") end
      end, 50)
    end,
  })
end

local transient = { transient = true }

local function open_opts(prefills)
  return vim.tbl_extend("force", transient, { prefills = prefills })
end

return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>rr",
      function() require("grug-far").open(transient) end,
      desc = "Search & replace",
    },
    -- rw: word boundary (like <leader>sw)
    {
      "<leader>rw",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({ search = vim.fn.expand("<cword>"), flags = "-w" }))
      end,
      desc = "Replace word",
    },
    {
      "<leader>rw",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({ search = get_visual_selection(), flags = "--fixed-strings -w" }))
      end,
      mode = "v",
      desc = "Replace word (selection)",
    },
    -- ra: plain text, no word boundary (like <leader>sa)
    {
      "<leader>ra",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({ search = vim.fn.expand("<cword>") }))
      end,
      desc = "Replace text",
    },
    {
      "<leader>ra",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({ search = get_visual_selection(), flags = "--fixed-strings" }))
      end,
      mode = "v",
      desc = "Replace text (selection)",
    },
    -- rW: WORD (whitespace-delimited)
    {
      "<leader>rW",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({ search = vim.fn.expand("<cWORD>"), flags = "--fixed-strings" }))
      end,
      desc = "Replace cWORD",
    },
    -- rb: scoped to current file
    {
      "<leader>rb",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({
          search = vim.fn.expand("<cword>"),
          paths = vim.fn.expand("%"),
        }))
      end,
      desc = "Replace cword in buffer",
    },
    {
      "<leader>rb",
      function()
        goto_replace_on_open()
        require("grug-far").open(open_opts({
          search = get_visual_selection(),
          flags = "--fixed-strings",
          paths = vim.fn.expand("%"),
        }))
      end,
      mode = "v",
      desc = "Replace selection in buffer",
    },
  },
  config = function(_, opts)
    require("grug-far").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("grug_far_esc", { clear = true }),
      pattern = "grug-far",
      callback = function(ev)
        vim.keymap.set("n", "<Esc>", function()
          local ok, instance = pcall(require("grug-far").get_instance, ev.buf)
          if ok and instance then instance:close() end
        end, { buffer = ev.buf })
      end,
    })
  end,
  opts = {
    engine = "ripgrep",
    icons = {
      enabled = false,
    },
    spinnerStates = false,
    resultsSeparatorLineChar = "-",
    keymaps = {
      replace = { n = "<localleader>r" },
      qflist = { n = "<localleader>q" },
      syncLocations = { n = "<localleader>s" },
      syncLine = { n = "<localleader>l" },
      close = { n = "q" },
      historyOpen = { n = "<localleader>t" },
      historyAdd = { n = "<localleader>a" },
      refresh = { n = "<localleader>f" },
      openLocation = { n = "<localleader>o" },
      gotoLocation = { n = "<enter>" },
      pickHistoryEntry = { n = "<enter>" },
      abort = { n = "<localleader>b" },
      toggleShowCommand = { n = "<localleader>p" },
      swapEngine = { n = "<localleader>e" },
    },
  },
}
