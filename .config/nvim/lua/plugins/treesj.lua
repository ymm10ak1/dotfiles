local vscode = require("utils").vscode_check

return {
  "Wansmer/treesj",
  cond = vscode,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>sj", "<Cmd>TSJToggle<CR>", desc = "Treesj Toggle Mode" },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 150,
  },
}
