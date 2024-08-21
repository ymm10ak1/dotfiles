local vscode = require("utils").vscode_check

return {
    {
        "lambdalisue/kensaku.vim",
        cond = vscode,
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "vim-denops/denops.vim",
        },
    },
    {
        "lambdalisue/kensaku-search.vim",
        cond = vscode,
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        config = function()
            vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = true })
        end,
    },
}
