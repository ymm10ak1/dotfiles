local vscode = require("utils").vscode_check

return {
    "akinsho/bufferline.nvim",
    cond = vscode,
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            indicator = {
                style = "icon",
            },
            separator_style = "slant",
        },
    },
    init = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<C-k>", "<cmd>BufferLineCyclePrev<CR>", opts)
        vim.keymap.set("n", "<C-j>", "<cmd>BufferLineCycleNext<CR>", opts)
    end,
}
