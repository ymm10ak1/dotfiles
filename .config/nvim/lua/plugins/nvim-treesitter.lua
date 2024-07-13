return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufNewFile", "BufRead" },
        cmd = { "TSUpdate", "TSInstall" },
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
                    "toml",
                    "latex",
                    "rust",
                    "luadoc",
                },
                sync_install = false,
                highlight = { enable = true },
                -- indent = { enable = true },
                endwise = { enable = true },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufRead", "BufNewFile" },
        opts = {},
        config = function()
            require("nvim-ts-autotag").setup({})
        end,
    },
}
