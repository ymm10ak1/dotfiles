return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    -- stylua: ignore start
    { "<leader>to", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>tn", function() Snacks.picker.todo_comments({ keywords = { "NOTE" } }) end, desc = "Note" },
    { "<leader>tw", function() Snacks.picker.todo_comments({ keywords = { "BUG" } }) end, desc = "Bug" },
    { "<leader>tt", function() Snacks.picker.todo_comments({ keywords = { "TODO", "NOTE", "BUG" } }) end, desc = "Todo/Note/Bug" },
    -- stylua: ignore end
  },
}
