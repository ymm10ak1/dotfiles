local vscode = require("utils").vscode_check

return {
  "brenoprata10/nvim-highlight-colors",
  cond = vscode,
  -- event = { "BufRead", "BufNewFile" },
  opts = {},
}
