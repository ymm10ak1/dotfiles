local vscode = require("utils").vscode_check

return {
  "williamboman/mason.nvim",
  cond = vscode,
  cmd = "Mason",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
