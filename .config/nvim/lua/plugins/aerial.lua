local vscode = require("utils").vscode_check

return {
  "stevearc/aerial.nvim",
  enabled = false,
  cond = vscode,
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>at", "<Cmd>AerialToggle!<CR>" },
  },
}
