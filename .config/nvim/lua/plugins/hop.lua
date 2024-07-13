return {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {},
    config = function()
        local hop = require("hop")
        hop.setup({
            keys = "etovxqpdygfblzhckisuran",
            quit_key = "<SPC>",
        })
        vim.keymap.set("n", "<leader>rj", ":HopLineStart<CR>")
        vim.keymap.set("n", "<leader>a", ":HopLine<CR>")
        vim.keymap.set("n", "<leader>wo", ":HopWord<CR>")
    end,
}
