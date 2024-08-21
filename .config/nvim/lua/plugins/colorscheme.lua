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
            require("tokyonight").setup({
                transparent = false,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
            -- vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "catppuccin/nvim",
        cond = vscode,
        name = "catppuccin",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        "navarasu/onedark.nvim",
        cond = vscode,
        priority = 1000,
        enabled = false,
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
        enabled = true,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end,
    },
}
