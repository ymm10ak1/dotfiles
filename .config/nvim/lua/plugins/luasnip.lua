local vscode = require("utils").vscode_check

return {
    "L3MON4D3/LuaSnip",
    cond = vscode,
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    build = "make install_jsregexp",
}
