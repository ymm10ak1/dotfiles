return {
    "easymotion/vim-easymotion",
    enabled = false,
    -- event = "VeryLazy",
    config = function ()
        vim.keymap.set("n", "<leader>a", "<Plug>(easymotion-bd-jk)")
    end
}
