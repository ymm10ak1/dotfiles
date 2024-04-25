return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "lua",
                    "vim",
                    "vimdoc",
                    "go",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "regex",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "dockerfile",
                    "python",
                    "json",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
                endwise = { enable = true },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        config = function()
            require("nvim-ts-autotag").setup({})
        end,
    },
}
