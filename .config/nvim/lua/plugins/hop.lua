return {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    keys = {
        { "<leader>rj", "<Cmd>HopLineStart<CR>", desc = "HopLineStart"},
        { "<leader>a", "<Cmd>HopVertical<CR>", desc = "HopVertical"},
    },
    config = function ()
        require("hop").setup({
            keys = "etovxqpdygfblzhckisuran",
        })
    end
}
