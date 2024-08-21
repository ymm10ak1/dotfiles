local vscode = require("utils").vscode_check
return {
    -- amongst your other plugins
    "akinsho/toggleterm.nvim",
    cond = vscode,
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    opts = {
        open_mapping = [[<c-\>]],
    },
}
