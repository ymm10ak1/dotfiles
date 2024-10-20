local vscode = require("utils").vscode_check

return {
    "nvim-treesitter/nvim-treesitter",
    cond = vscode,
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
                "html",
                "python",
                "javascript",
                "typescript",
                "json",
                "rust",
                "regex",
                "toml",
                "yaml",
            },
            sync_install = false,
            highlight = { enable = true },
            endwise = { enable = true },
        })
    end,
}
