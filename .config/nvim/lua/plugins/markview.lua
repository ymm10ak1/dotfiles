local vscode = require("utils").vscode_check

return {
  "OXY2DEV/markview.nvim",
  cond = vscode,
  enabled = false,
  ft = "markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
}
