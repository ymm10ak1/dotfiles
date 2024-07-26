return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {},
        keys = {
            { "<leader>tt", "<cmd>TodoTelescope<CR>", desc = "TodoComments Telescope" },
        },
    },
}
