local vscode = require("utils").vscode_check

return {
    "L3MON4D3/LuaSnip",
    cond = vscode,
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
    end,
}
