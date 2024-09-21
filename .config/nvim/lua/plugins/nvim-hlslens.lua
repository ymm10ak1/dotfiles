return {
    { "kevinhwang91/nvim-ufo" },
    { "rapan931/lasterisk.nvim" },
    {
        "kevinhwang91/nvim-hlslens",
        event = { "BufRead", "BufNewFile" },
        ft = "lazy",
        -- dependencies = {
        --     "kevinhwang91/nvim-ufo",
        --     "rapan931/lasterisk.nvim",
        -- },
        config = function()
            require("hlslens").setup()
            local kopts = { noremap = true, silent = true }
            vim.keymap.set(
                "n",
                "n",
                [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]],
                kopts
            )
            vim.keymap.set(
                "n",
                "N",
                [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]],
                kopts
            )
            vim.keymap.set("n", "*", function()
                require("lasterisk").search()
                require("hlslens").start()
            end, kopts)
            vim.keymap.set({ "n", "x" }, "g*", function()
                require("lasterisk").search({ is_whole = false })
                require("hlslens").start()
            end, kopts)
            vim.keymap.set("n", "#", [[#<cmd>lua require('hlslens').start()<cr>]], kopts)
            vim.keymap.set("n", "g#", [[g#<cmd>lua require('hlslens').start()<cr>]], kopts)
        end,
    },
}
