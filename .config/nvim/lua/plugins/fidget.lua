local vscode = require("utils").vscode_check

return {
    "j-hui/fidget.nvim",
    cond = vscode,
    event = { "BufRead", "BufNewFile" },
    config = true,
}
