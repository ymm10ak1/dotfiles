local vscode = require("utils").vscode_check

return {
  "simeji/winresizer",
  cond = vscode,
  keys = {
    { "<C-e>", "<Cmd>WinResizerStartResize<CR>", desc = "WinResizer Start" },
  },
}
