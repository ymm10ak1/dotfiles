local vscode = require("utils.helper").vscode_check

return {
    "nvim-lualine/lualine.nvim",
    cond = vscode,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            globalstatus = true,
        },
    },
}
