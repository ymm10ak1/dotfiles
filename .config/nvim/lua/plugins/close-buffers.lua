local vscode = require("utils").vscode_check

return {
  "kazhala/close-buffers.nvim",
  cond = vscode,
  keys = {
    { "<leader>co", "<Cmd>BDelete other<CR>", desc = "BDelete other" },
  },
  opts = {
    preserve_window_layout = { "this" },
    next_buffer_cmt = function(windows)
      require("bufferline").cycle(1)
      local bufnr = vim.api.nvim_get_current_buf()

      for _, window in ipairs(windows) do
        vim.api.nvim_win_set_buf(window, bufnr)
      end
    end,
  },
}
