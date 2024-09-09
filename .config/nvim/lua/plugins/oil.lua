local vscode = require("utils").vscode_check

return {
    "stevearc/oil.nvim",
    cond =vscode,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>fe", "<cmd>Oil<cr>", desc = "Oil" },
    },
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
}
