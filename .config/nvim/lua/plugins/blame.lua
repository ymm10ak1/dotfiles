local vscode = require("utils").vscode_check

return {
    "FabijanZulj/blame.nvim",
    cond = vscode,
    cmd = "BlameToggle",
    keys = {
        { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
    },
    opts = {},
}
