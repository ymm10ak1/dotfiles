return {
    {
        "lambdalisue/kensaku.vim",
        event = "VeryLazy",
        dependencies = {
            "vim-denops/denops.vim",
        },
    },
    {
        "lambdalisue/kensaku-search.vim",
        event = "VeryLazy",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        config = function()
            vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>")
        end,
    },
}
