local vscode = require("utils.helper").vscode_check

return {
    "stevearc/aerial.nvim",
    cond = vscode,
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>o", "<cmd>AerialToggle!<cr>" },
    },
}
