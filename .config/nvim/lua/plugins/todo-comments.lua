local vscode = require("utils.helper").vscode_check
return {
    "folke/todo-comments.nvim",
    cond = vscode,
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
        { "<leader>tt", "<cmd>TodoTelescope<CR>", desc = "TodoComments Telescope" },
    },
}
