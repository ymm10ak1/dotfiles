local vscode = require("utils").vscode_check

return {
  "folke/snacks.nvim",
  cond = vscode,
  priority = 1000,
  lazy = false,
  -- dependencies = { "echasnovski/mini.icons" },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "d",
            desc = "Dotfiles",
            action = ":lua Snacks.dashboard.pick('files', {cwd = '~/dotfiles', hidden = true})",
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    explorer = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      layout = {
        preset = function()
          return vim.o.columns >= 120 and "telescope" or "vertical"
        end,
      },
      formatters = {
        file = { filename_first = true },
      },
      win = {
        input = {
          keys = {
            ["<C-f>"] = false,
            ["<C-b>"] = { "list_scroll_down", mode = { "i", "n" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "n" } },
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<C-p>"] = { "preview_scroll_up", mode = { "i" } },
          },
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    bufdelete = { enabled = true },
    zen = { enabled = true },

    indent = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    lazygit = { enabled = false },
    terminal = { enabled = false },
    animate = { enabled = false },
    dim = { enabled = false },
    gitbrowse = { enabled = false },
  },
  keys = {
    -- stylua: ignore start
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find files" },
    { "<leader>fd", function() Snacks.picker.files({ cwd = "~/dotfiles", hidden = true }) end, desc = "Find files dotfiles" },
    { "<leader>re", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo history" },
    { "<leader>fb", function() Snacks.picker.buffers({ hidden = true }) end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep" },
    { "<leader>fi", function() Snacks.picker.explorer() end, desc = "File Explorer" },
    { "<leader>co", function() Snacks.bufdelete.other() end, desc = "Bufdelete Other" },
    { "<leader>zz", function() Snacks.zen() end, desc = "Zen Mode" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "gri", function() Snacks.picker.lsp_implementations() end, nowait = true, desc = "Goto Implementation" },
    { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- stylua: ignore end
  },
}
