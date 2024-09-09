local vscode = require("utils").vscode_check

return {
    { "kkharji/sqlite.lua", cond = vscode },
    { "nvim-telescope/telescope-fzy-native.nvim", cond = vscode },
    {
        "danielfalk/smart-open.nvim",
        cond = vscode,
        branch = "0.2.x",
        -- dependencies = {
        --     "kkharji/sqlite.lua",
        --     { "nvim-telescope/telescope-fzy-native.nvim" },
        -- },
    },
}
