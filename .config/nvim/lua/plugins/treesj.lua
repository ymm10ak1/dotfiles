return {
    "Wansmer/treesj",
    keys = {
        {
            "<leader>m",
            function()
                require("treesj").toggle()
            end,
            desc = "toggle mode",
        },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesj").setup({})
    end,
}
