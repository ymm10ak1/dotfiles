local vscode = require("utils.helper").vscode_check

return {
    "hrsh7th/nvim-cmp",
    cond =vscode,
    -- InsertEnter: 挿入モードを開始したとき
    -- CmdlineEnter: カーソルがコマンドラインに移動したあと
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            event = "InsertEnter",
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
        { "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
        { "hrsh7th/cmp-buffer", event = "InsertEnter" },
        { "hrsh7th/cmp-path", event = "InsertEnter" },
        { "hrsh7th/cmp-cmdline", event = { "ModeChanged", "CmdlineEnter" } },
        { "dmitmel/cmp-cmdline-history", event = { "ModeChanged", "CmdlineEnter" } },
        { "onsails/lspkind.nvim", event = "InsertEnter" },
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

        cmp.setup({
            -- mapping = cmp.mapping.preset.insert({
            --     ["<Tab>"] = function(fallback)
            --         if cmp.visible() then
            --             cmp.select_next_item()
            --         else
            --             fallback()
            --         end
            --     end,
            --     ["<S-Tab>"] = function(fallback)
            --         if cmp.visible() then
            --             cmp.select_prev_item()
            --         else
            --             fallback()
            --         end
            --     end,
            --     ["<C-j>"] = function(fallback)
            --         if cmp.visible() then
            --             cmp.select_next_item()
            --         else
            --             fallback()
            --         end
            --     end,
            --     ["<C-k>"] = function(fallback)
            --         if cmp.visible() then
            --             cmp.select_prev_item()
            --         else
            --             fallback()
            --         end
            --     end,
            --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
            --     ["<C-l>"] = cmp.mapping.complete(),
            --     ["<C-e>"] = cmp.mapping.abort(),
            --     ["<CR>"] = cmp.mapping.confirm({ select = true }),
            -- }),
            mapping = {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "c", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "c", "s" }),
                ["<C-j>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "c", "s" }),
                ["<C-k>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "c", "s" }),
                ["<C-u>"] = cmp.mapping(function(fallback)
                    if cmp.visible_docs() then
                        cmp.mapping.scroll_docs(-4)
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<C-d>"] = cmp.mapping(function(fallback)
                    if cmp.visible_docs() then
                        cmp.mapping.scroll_docs(4)
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                {
                    name = "buffer",
                    option = {
                        keyword_length = 2,
                    },
                },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDatails = true,
                }),
            },
        })

        -- `/, ?` cmdline setup
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {
                    name = "buffer",
                    option = {
                        keyword_length = 1,
                    },
                },
                { name = "cmdline_history" },
            },
        })

        -- `:` cmdline setup
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })
    end,
}
