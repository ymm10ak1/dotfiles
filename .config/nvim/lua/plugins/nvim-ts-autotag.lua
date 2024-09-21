local vscode = require("utils").vscode_check

return {
    "windwp/nvim-ts-autotag",
    cond = vscode,
    ft = {"html", "javascript", "markdown", "typescript"},
    opts = {},
}
