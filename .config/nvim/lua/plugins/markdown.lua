local vscode = require("utils").vscode_check

return {
    {
        "MeanderingProgrammer/markdown.nvim",
        cond = vscode,
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
        cond = vscode,
        ft = "markdown",
    },
}
