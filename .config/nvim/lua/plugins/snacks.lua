return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = require("plugins.snacks.dashboard"),
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
            ["<C-n>"] = { "list_scroll_down", mode = { "i", "n" } },
            ["<C-p>"] = { "list_scroll_up", mode = { "i", "n" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "n" } },
            ["<C-b>"] = { "preview_scroll_up", mode = { "i" } },
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
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
