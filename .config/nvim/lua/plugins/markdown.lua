return {
    {
        "MeanderingProgrammer/markdown.nvim",
        ft = "markdown",
        name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- Mandatory
            "nvim-tree/nvim-web-devicons", -- Optional but recommended
        },
        keys = {
            { "<M-r>", "<cmd>RenderMarkdown toggle<cr>" },
        },
        opts = {
            -- Markdownをデフォルトではレンダリングしない
            enabled = false,
        },
    },
    {
        "ixru/nvim-markdown",
        ft = "markdown",
        event = { "BufReadPre", "BufNewFile" },
    },
}
