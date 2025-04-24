return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>sj", "<Cmd>TSJToggle<CR>", desc = "Treesj Toggle Mode" },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 150,
  },
}
