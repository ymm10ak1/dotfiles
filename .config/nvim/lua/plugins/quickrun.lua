local vscode = require("utils.helper").vscode_check

return {
    "thinca/vim-quickrun",
    cond = vscode,
    event = "VeryLazy",
    -- config = function ()
    --     vim.keymap.set("n", "<leader>r", "<cmd>Quickrun")
    -- <end
}
