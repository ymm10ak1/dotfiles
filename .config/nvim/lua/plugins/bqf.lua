local vscode = require("utils").vscode_check

return {
    "kevinhwang91/nvim-bqf",
    cond = vscode,
    ft = "qf",
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
