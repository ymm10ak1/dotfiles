return {
    "akinsho/bufferline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local opts = { noremap = true, silent = true }
        require("bufferline").setup({})
        vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
        vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", opts)
    end,
}
