local vscode = require("utils").vscode_check

return {
  "danielfalk/smart-open.nvim",
  enabled = false,
  cond = vscode,
  branch = "0.2.x",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
