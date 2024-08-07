local vscode = require("utils.helper").vscode_check

return {
    {
        "williamboman/mason.nvim",
        cond = vscode,
        cmd = "Mason",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cond = vscode,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "gopls", "tsserver", "ruff", "bashls" },
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name) -- default handler
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                -- you can provide targeted overrides for specific servers
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                format = {
                                    -- styluaを適用するため無効
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        cond = vscode,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "textlint",
                    "clang-format",
                    "prettier",
                    "shfmt",
                    "markdownlint",
                    "shellcheck",
                    "markdownlint-cli2",
                },
                automatic_setup = true,
                handlers = {},
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        cond = vscode,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.textlint,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.clang_format.with({
                        disabled_filetypes = { "java" },
                    }),
                    null_ls.builtins.formatting.gofmt,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.shfmt.with({
                        extra_args = { "-i", "2", "-ci" },
                    }),
                    null_ls.builtins.diagnostics.markdownlint_cli2,
                    null_ls.builtins.diagnostics.markdownlint,
                    null_ls.builtins.formatting.markdownlint,
                },
            })
        end,
    },
}
