local vscode = require("utils").vscode_check

return {
    { "rafamadriz/friendly-snippets", cond = vscode },
    {
        "L3MON4D3/LuaSnip",
        cond = vscode,
        -- event = "InsertEnter",
        -- dependencies = { "rafamadriz/friendly-snippets" },
        version = "v2.*",
        build = "make install_jsregexp",
    },
}
