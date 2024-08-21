local vscode = require("utils").vscode_check

return {
    "thinca/vim-quickrun",
    cond = vscode,
    cmd = "Quickrun",
}
