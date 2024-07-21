return {
    "nvimdev/lspsaga.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local keymap = vim.keymap.set
        require("lspsaga").setup({
            finder = {
                max_height = 0.6,
                right_width = 0.6,
                keys = {
                    vsplit = "v",
                    split = "s",
                    quit = "q",
                },
            },
            lightbulb = {
                enable = false,
            },
            definition = {
                height = 0.6,
            },
            code_action = {
                show_server_name = true,
                extend_gitsigns = false,
            }
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function (ev)
                local opts = { buffer = ev.buf }
                -- diagnostic
                keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
                keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
                keymap("n", "ge", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", opts)
                -- code action
                keymap("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
                -- hover
                keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
                -- finder
                keymap("n", "gn", "<cmd>Lspsaga finder<cr>", opts)
                -- definition
                keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
                keymap("n", "gy", "<cmd>Lspsaga peek_type_definition<cr>", opts)
            end
        })
    end,
    depedencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
