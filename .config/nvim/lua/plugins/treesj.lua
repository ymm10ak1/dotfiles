local vscode = require("utils").vscode_check

return {
    "Wansmer/treesj",
    cond = vscode,
    keys = {
        { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Treesj Toggle Mode" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        use_default_keymaps = false,
        max_join_length = 150,
    },
}
