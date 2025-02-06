local vscode = require("utils").vscode_check

return {
  "nvimdev/lspsaga.nvim",
  cond = vscode,
  event = { "LspAttach" },
  depedencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    finder = {
      max_height = 0.6,
      right_width = 0.6,
      keys = {
        vsplit = "v",
        split = "s",
        quit = "q",
      },
    },
    lightbulb = {
      enable = false,
    },
    definition = {
      height = 0.6,
    },
    code_action = {
      show_server_name = true,
      extend_gitsigns = false,
    },
  },
  init = function()
    local keymap = vim.keymap.set
    -- diagnostic
    keymap("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
    keymap("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
    keymap("n", "go", "<Cmd>Lspsaga show_workspace_diagnostics ++float<CR>")
    -- code action
    -- keymap("n", "ga", "<Cmd>Lspsaga code_action<cr>")
    -- hover
    keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
    -- finder
    keymap("n", "gn", "<Cmd>Lspsaga finder<CR>")
    -- definition
    keymap("n", "gd", "<Cmd>Lspsaga peek_definition<CR>")
    keymap("n", "gy", "<Cmd>Lspsaga peek_type_definition<CR>")
  end,
}
