local vscode = require("utils.helper").vscode_check

return {
    "brenoprata10/nvim-highlight-colors",
    cond = vscode,
    event = { "BufRead", "BufNewFile" },
    config = true,
}
