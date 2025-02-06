local vscode = require("utils").vscode_check

return {
  "sindrets/diffview.nvim",
  cond = vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  opts = {
    keymaps = {
      file_panel = {
        ["s"] = false,
      },
    },
  },
  init = function()
    vim.keymap.set("n", "<leader>dq", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
  end,
}
