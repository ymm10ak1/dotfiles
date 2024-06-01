return {
    "stevearc/oil.nvim",
    keys = {
        { "<leader>fe", "<cmd>Oil<cr>", desc = "Oil" },
    },
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
        })
    end,
}
