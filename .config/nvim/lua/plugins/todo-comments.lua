local vscode = require("utils").vscode_check
return {
    "folke/todo-comments.nvim",
    cond = vscode,
    -- event = { "BufRead", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        { "<leader>tt", "<cmd>TodoTelescope<CR>", desc = "TodoComments Telescope" },
        { "<leader>tq", "<cmd>TodoQuickFix<CR>", desc = "TodoComments QuickFix" },
    },
}
