local vscode = require("utils.helper").vscode_check

return {
    "kazhala/close-buffers.nvim",
    cond = vscode,
    event = { "BufReadPre", "BufNewFile"},
    config = function ()
        require("close_buffers").setup({
            preserve_window_layout = {"this"},
            next_buffer_cmt = function (windows)
                require("bufferline").cycle(1)
                local bufnr = vim.api.nvim_get_current_buf()

                for _, window in ipairs(windows) do
                    vim.api.nvim_win_set_buf(window, bufnr)
                end
            end,
        })
        vim.keymap.set("n", "<leader>to", "<cmd>BDelete other<cr>")
        vim.keymap.set("n", "<leader>tc", "<cmd>BDelete this<cr>")
    end
}
