local vscode = require("utils").vscode_check

return {
  "folke/snacks.nvim",
  cond = vscode,
  priority = 1000,
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = false },
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
          },
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    lazygit = { enabled = false },
    bufdelete = { enabled = true },
    terminal = { enabled = false },
    animate = { enabled = false },
    dim = { enabled = false },
    zen = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find files" },
    { "<leader>fd", function() Snacks.picker.files({ cwd = "~/dotfiles", hidden = true }) end, desc = "Find files dotfiles" },
    { "<leader>re", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo history" },
    { "<leader>fb", function() Snacks.picker.buffers({ hidden = true }) end, desc = "Buffers" },
    { "<leader>gl", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fi", function() Snacks.picker.explorer() end, desc = "File Explorer" },
    { "<leader>co", function() Snacks.bufdelete.other() end, desc = "Bufdelete Other" },
    { "<leader>zz", function() Snacks.zen() end, desc = "Zen Mode" },
    -- { "<leader>to", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    -- stylua: ignore end
  },
}
