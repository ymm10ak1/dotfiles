local vscode = require("utils").vscode_check

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
        -- dependencies = {
        --     "williamboman/mason.nvim",
        --     "neovim/nvim-lspconfig",
        --     "hrsh7th/cmp-nvim-lsp",
        -- },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "gopls", "ts_ls", "bashls", "pyright" },
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
                ["clangd"] = function()
                    lspconfig.clangd.setup({
                        cmd = { "clangd", "--header-insertion=never" },
                    })
                end,
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        cond = vscode,
        event = { "BufReadPre", "BufNewFile" },
        -- dependencies = {
        --     "williamboman/mason.nvim",
        --     "nvimtools/none-ls.nvim",
        -- },
        config = function()
            local null_ls = require("null-ls")
            require("mason").setup({})
            null_ls.setup({
                diagnostics_format = "[#{c}] #{m} (#{s})",
                sources = {
                    null_ls.builtins.diagnostics.textlint,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.clang_format.with({
                        disabled_filetypes = { "java", "json", "javascript" },
                    }),
                    null_ls.builtins.formatting.gofmt,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.shfmt.with({
                        extra_args = { "-i", "2", "-ci", "-bn" },
                    }),
                    null_ls.builtins.diagnostics.markdownlint_cli2,
                    null_ls.builtins.diagnostics.markdownlint,
                    null_ls.builtins.formatting.markdownlint,
                },
            })
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = true,
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        cond = vscode,
        -- dependencies = { "nvim-lua/plenary.nvim" },
        -- config = function()
        --     local null_ls = require("null-ls")
        --     null_ls.setup({
        --         diagnostics_format = "[#{c}] #{m} (#{s})",
        --         sources = {
        --             null_ls.builtins.diagnostics.textlint,
        --             null_ls.builtins.formatting.stylua,
        --             null_ls.builtins.formatting.clang_format.with({
        --                 disabled_filetypes = { "java", "json", "javascript" },
        --             }),
        --             null_ls.builtins.formatting.gofmt,
        --             null_ls.builtins.formatting.prettier,
        --             null_ls.builtins.formatting.shfmt.with({
        --                 extra_args = { "-i", "2", "-ci", "-bn" },
        --             }),
        --             null_ls.builtins.diagnostics.markdownlint_cli2,
        --             null_ls.builtins.diagnostics.markdownlint,
        --             null_ls.builtins.formatting.markdownlint,
        --         },
        --     })
        -- end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        cond = vscode,
        enabled = false,
        event = "LspAttach",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason").setup({})
            require("mason-nvim-dap").setup({
                ensure_installed = { "cpptools", "codelldb" },
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })
        end,
    },
}
