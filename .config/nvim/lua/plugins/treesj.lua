return {
    "Wansmer/treesj",
    keys = {
        { "<leader>m", "<cmd>TSJToggle<cr>", desc = "toggle mode" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        use_default_keymaps = false,
        max_join_length = 150,
    },
}
