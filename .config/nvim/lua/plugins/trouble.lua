local vscode = require("utils").vscode_check

return {
  "folke/trouble.nvim",
  enabled = false,
  cond = vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>cs", "<Cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
    {
      "<leader>xl",
      "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    { "<leader>xL", "<Cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
    { "<leader>xq", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
  },
}
