return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-\>]],
    size = 10,
  },
  keys = {
    { [[<C-\>]], "<Cmd>ToggleTerm<CR>", desc = "Open ToggleTerm" },
    {
      "<leader>te",
      function()
        local Term = require("toggleterm.terminal").Terminal
        local t = Term:new({
          dir = "%:p:h",
          display_name = vim.fn.expand("%:p:h"),
        })
        t:toggle()
        -- local curDir = vim.fn.expand("%:p:h")
        -- vim.cmd("ToggleTerm dir=" .. curDir)
      end,
      desc = "カレントバッファがあるディレクトリを開く",
    },
  },
}
