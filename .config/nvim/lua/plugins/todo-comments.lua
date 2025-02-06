local vscode = require("utils").vscode_check

return {
  "folke/todo-comments.nvim",
  cond = vscode,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>tt", "<Cmd>TodoTelescope<CR>", desc = "TodoComments Telescope" },
    { "<leader>tq", "<Cmd>TodoQuickFix<CR>", desc = "TodoComments QuickFix" },
  },
}
