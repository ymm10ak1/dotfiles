local vscode = require("utils").vscode_check

return {
    "CRAG666/code_runner.nvim",
    cond = vscode,
    keys = {
        {"<C-A-n>", "<Cmd>RunCode<CR>", desc = "CodeRunner RunCode"}
    },
    opts = {}
}
