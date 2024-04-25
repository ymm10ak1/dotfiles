return {
    -- amongst your other plugins
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
        })

        -- local Terminal = require("toggleterm.terminal").Terminal
        -- local lazygit = Terminal:new({
        --     cmd = "lazygit",
        --     direction = "float",
        --     hidden = true,
        -- })
        -- function _lazygit_toggle()
        --     lazygit:toggle()
        -- end
        --
        -- vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end,
}
