return {
    "kevinhwang91/nvim-hlslens",
    event = { "BufNewFile", "BufRead" },
    dependencies = {
        "kevinhwang91/nvim-ufo",
    },
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
        vim.keymap.set("n", "*", [[*<cmd>lua require('hlslens').start()<cr>]], kopts)
        vim.keymap.set("n", "#", [[#<cmd>lua require('hlslens').start()<cr>]], kopts)
        vim.keymap.set("n", "g*", [[g*<cmd>lua require('hlslens').start()<cr>]], kopts)
        vim.keymap.set("n", "g#", [[g#<cmd>lua require('hlslens').start()<cr>]], kopts)
    end,
}
