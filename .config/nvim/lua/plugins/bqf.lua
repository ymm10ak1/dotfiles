local vscode = require("utils.helper").vscode_check

return {
    "kevinhwang91/nvim-bqf",
    cond = vscode,
    event = "VeryLazy",
    config = function()
        require("bqf").setup({
            func_map = {
                split = "<C-s>",
            },
            filter = {
                fzf = {
                    action_for = { ["ctrl-s"] = "split" },
                },
            },
        })
    end,
}
