return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufRead", "BufNewFile" },
        opts = {},
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        config = true,
    },
    {
        "FabijanZulj/blame.nvim",
        event = "BufRead",
        cmd = "BlameToggle",
        keys = {
            { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
        },
        opts = {},
    },
}
