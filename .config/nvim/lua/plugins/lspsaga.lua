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
                },
            },
            lightbulb = {
                enable = false,
            },
            definition = {
                height = 0.6,
            },
        })
        -- diagnostic
        keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
        keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
        -- code action
        keymap("n", "ga", "<cmd>Lspsaga code_action<cr>")
        -- hover
        keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>")
        -- finder
        keymap("n", "gn", "<cmd>Lspsaga finder<cr>")
        -- definition
        keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>")
        keymap("n", "gy", "<cmd>Lspsaga peek_type_definition<cr>")
    end,
    depedencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
