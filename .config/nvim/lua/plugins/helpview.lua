local vscode = require("utils").vscode_check

return {
    "OXY2DEV/helpview.nvim",
    cond = vscode,
    -- lazy = false,
    ft = "help",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
