local vscode = require("utils").vscode_check

return {
    "jiaoshijie/undotree",
    cond = vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>u", "<Cmd>lua require('undotree').toggle()<CR>", desc = "Toggle undotree" },
    },
    opts = {},
}
