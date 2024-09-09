local vscode = require("utils").vscode_check

return {
    {
        "folke/tokyonight.nvim",
        cond = vscode,
        enabled = false,
        lazy = false,
        priority = 1000,
        opt = {},
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "catppuccin/nvim",
        cond = vscode,
        name = "catppuccin",
        enabled = true,
        priority = 1000,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        "navarasu/onedark.nvim",
        cond = vscode,
        priority = 1000,
        enabled = false,
        lazy = false,
        config = function()
            require("onedark").setup({
                style = "darker",
            })
            require("onedark").load()
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        cond = vscode,
        priority = 1000,
        enabled = false,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end,
    },
}
