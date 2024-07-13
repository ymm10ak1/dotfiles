return {
    {
        "MeanderingProgrammer/markdown.nvim",
        ft = { "markdown" },
        name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- Mandatory
            "nvim-tree/nvim-web-devicons", -- Optional but recommended
        },
        config = function()
            require("render-markdown").setup({
                -- Markdownをデフォルトではレンダリングしない
                enabled = false,
            })
            vim.keymap.set("n", "<M-r>", "<cmd>RenderMarkdownToggle<CR>")
        end,
    },
    {
        "ixru/nvim-markdown",
        ft = { "markdown" },
        event = { "BufReadPre", "BufNewFile" },
    },
}
