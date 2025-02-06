local vscode = require("utils").vscode_check

return {
  "NStefan002/screenkey.nvim",
  cond = vscode,
  -- lazy = false,
  version = "*",
  keys = {
    { "<leader>sk", "<Cmd>Screenkey toggle<CR>", desc = "Toggle ScreenKey" },
  },
  opts = {
    win_opts = {
      row = vim.o.lines - vim.o.cmdheight - 2,
      width = 50,
      height = 1,
    },
    clear_after = 5,
    disable = {
      filetypes = { "lazy", "TelescopePrompt" },
      buftypes = { "terminal" },
    },
    group_mappings = true,
  },
  -- init = function()
  --     vim.keymap.set("n", "<leader>sk", "<Cmd>Screenkey toggle<CR>", { desc = "Toggle ScreenKey" })
  -- end,
}
