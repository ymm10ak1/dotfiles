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
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("userLspsagaConfig", { clear = true }),
      callback = function(ev)
        local keymap = vim.keymap.set
        local opts = { noremap = true, buffer = ev.buf }
        -- diagnostic
        keymap("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
        keymap("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
        keymap("n", "go", "<Cmd>Lspsaga show_workspace_diagnostics ++float<CR>", opts)
        -- hover
        keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
        -- finder
        keymap("n", "gn", "<Cmd>Lspsaga finder<CR>", opts)
        -- definition
        keymap("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
        keymap("n", "gy", "<Cmd>Lspsaga peek_type_definition<CR>", opts)
        -- code action
        keymap("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf",
      group = vim.api.nvim_create_augroup("qfWinbarToggle", { clear = true }),
      callback = function()
        vim.cmd("Lspsaga winbar_toggle")
      end,
    })
  end,
}
