local vscode = require("utils").vscode_check

return {
    "folke/which-key.nvim",
    conf = vscode,
    event = "VeryLazy",
    init = function()
        local o = vim.o
        o.timeout = true
        o.timeoutlen = 300
    end,
    opts = {},
}
