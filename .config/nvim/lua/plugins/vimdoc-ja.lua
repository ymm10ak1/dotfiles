local vscode = require("utils.helper").vscode_check

return {
    "vim-jp/vimdoc-ja",
    conf = vscode,
    event = "VeryLazy",
    ft = "help",
}
