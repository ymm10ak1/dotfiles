local vscode = require("utils").vscode_check
return {
    -- amongst your other plugins
    "akinsho/toggleterm.nvim",
    cond = vscode,
    event = "VeryLazy",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
        })
    end,
}
