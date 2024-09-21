local vscode = require("utils").vscode_check

return {
    "lewis6991/gitsigns.nvim",
    cond = vscode,
    event = { "BufRead", "BufNewFile" },
    opts = {},
}
