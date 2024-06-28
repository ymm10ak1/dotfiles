return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost" },
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        config = true,
    },
    {
        "kdheepak/lazygit.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
            -- LazyGit起動時にESCを無効化
            vim.api.nvim_create_augroup("LazygitKeyMapping", {})
            vim.api.nvim_create_autocmd("TermOpen", {
                group = "LazygitKeyMapping",
                pattern = "*",
                callback = function()
                    local filetype = vim.bo.filetype
                    if filetype == "lazygit" then
                        -- なぜ動くのかはわからない
                        vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", "<ESC>", { silent = true })
                        vim.api.nvim_buf_set_keymap(0, "t", "<C-v><ESC>", [[<C-\><C-n>]], { silent = true })
                    end
                end,
            })
        end,
    },
}
