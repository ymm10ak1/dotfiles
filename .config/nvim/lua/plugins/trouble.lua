return {
    "folke/trouble.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    config = function()
        local keymap = vim.keymap.set
        keymap("n", "<leader>xx", function()
            require("trouble").toggle()
        end)
        keymap("n", "<leader>xw", function()
            require("trouble").toggle("workspace_diagnostics")
        end)
        keymap("n", "<leader>xd", function()
            require("trouble").toggle("document_diagnostics")
        end)
        keymap("n", "<leader>xq", function()
            require("trouble").toggle("quickfix")
        end)
        keymap("n", "<leader>xl", function()
            require("trouble").toggle("loclist")
        end)
        keymap("n", "gR", function()
            require("trouble").toggle("lsp_references")
        end)
    end,
}
