return {
  "sindrets/diffview.nvim",
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
    vim.keymap.set("n", "<leader>di", "<Cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
    vim.keymap.set("n", "<leader>dq", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
  end,
}
