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
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        opts = {
            keymaps = {
                file_panel = {
                    ["s"] = false,
                },
            },
        },
        init = function()
            vim.keymap.set("n", "<leader>dq", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
        end,
    },
    {
        "FabijanZulj/blame.nvim",
        cond = vscode,
        cmd = "BlameToggle",
        keys = {
            { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
        },
        opts = {},
    },
}
