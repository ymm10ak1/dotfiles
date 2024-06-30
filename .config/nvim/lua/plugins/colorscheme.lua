return {
    {
        "folke/tokyonight.nvim",
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
        name = "catppuccin",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        "navarasu/onedark.nvim",
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
        priority = 1000,
        enabled = true,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end,
    },
    {
        "tanvirtin/monokai.nvim",
        priority = 1000,
        enabled = false,
        lazy = false,
        config = function()
            require("monokai").setup({})
        end,
    },
}
