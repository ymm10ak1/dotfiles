local vscode = require("utils").vscode_check

return {
    {
        "lewis6991/gitsigns.nvim",
        cond = vscode,
        event = { "BufRead", "BufNewFile" },
        opts = {},
    },
    {
        "sindrets/diffview.nvim",
        cond = vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        init = function()
            vim.keymap.set("n", "<leader>dq", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
        end,
        config = true,
    },
    {
        "FabijanZulj/blame.nvim",
        cond = vscode,
        cmd = "BlameToggle",
        keys = {
            { "<leader>tb", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
        },
        opts = {},
    },
}
