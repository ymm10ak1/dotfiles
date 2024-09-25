local vscode = require("utils").vscode_check

return {
    "stevearc/aerial.nvim",
    cond = vscode,
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>ae", "<Cmd>AerialToggle!<CR>" },
    },
}
