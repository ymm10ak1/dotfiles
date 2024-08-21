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
        config = true,
    },
    {
        "FabijanZulj/blame.nvim",
        cond = vscode,
        -- event = "BufRead",
        cmd = "BlameToggle",
        keys = {
            { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
        },
        opts = {},
    },
}
