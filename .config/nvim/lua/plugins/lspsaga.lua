local vscode = require("utils").vscode_check

return {
    "nvimdev/lspsaga.nvim",
    cond = vscode,
    event = { "LspAttach" },
    -- depedencies = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-tree/nvim-web-devicons",
    -- },
    opts = {
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
        },
    },
    init = function()
        local keymap = vim.keymap.set
        -- diagnostic
        keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
        keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
        keymap("n", "go", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>")
        -- code action
        -- keymap("n", "ga", "<cmd>Lspsaga code_action<cr>")
        -- hover
        keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>")
        -- finder
        keymap("n", "gn", "<cmd>Lspsaga finder<cr>")
        -- definition
        keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>")
        keymap("n", "gy", "<cmd>Lspsaga peek_type_definition<cr>")
    end,
}
