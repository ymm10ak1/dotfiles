local vscode = require("utils").vscode_check

return {
  "stevearc/quicker.nvim",
  cond = vscode,
  event = "FileType qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  keys = {
    {
      ">",
      function()
        require("quicker").expand()
      end,
      ft = "qf",
      desc = "Expand quickfix context",
    },
    {
      "<",
      function()
        require("quicker").collapse()
      end,
      ft = "qf",
      desc = "Collapse quickfix context",
    },
    {
      "<leader>qu",
      function()
        require("quicker").toggle()
      end,
      desc = "Toggle quickfix",
    },
  },
  opts = {},
}
