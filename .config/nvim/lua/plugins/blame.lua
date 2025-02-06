local vscode = require("utils").vscode_check

return {
  "FabijanZulj/blame.nvim",
  enabled = false,
  cond = vscode,
  cmd = "BlameToggle",
  keys = {
    { "<leader>gb", "<Cmd>BlameToggle<CR>", desc = "Blame Toggle" },
  },
  opts = {},
}
