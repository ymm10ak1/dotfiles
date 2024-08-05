local vscode = require("utils.helper").vscode_check

return {
    "danielfalk/smart-open.nvim",
    cond = vscode,
    branch = "0.2.x",
    dependencies = {
        "kkharji/sqlite.lua",
        { "nvim-telescope/telescope-fzy-native.nvim" },
    },
}
