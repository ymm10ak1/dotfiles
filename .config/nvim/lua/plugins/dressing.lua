local vscode = require("utils").vscode_check

return {
  "stevearc/dressing.nvim",
  cond = vscode,
  opts = {},
}
