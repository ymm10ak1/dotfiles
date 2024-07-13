return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufRead" },
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        config = true,
    },
    {
        "FabijanZulj/blame.nvim",
        event = { "BufRead" },
        cmd = { "BlameToggle" },
        config = function()
            require("blame").setup({})
            vim.keymap.set("n", "<leader>gb", "<cmd>BlameToggle<cr>")
        end,
    },
}
