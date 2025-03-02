local vscode = require("utils").vscode_check

return {
  "stevearc/oil.nvim",
  cond = vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fe", "<Cmd>Oil<CR>", desc = "Oil" },
  },
  ---@module "oil"
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
}
