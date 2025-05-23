return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      indicator = {
        style = "icon",
      },
      separator_style = "slant",
    },
  },
  init = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<C-k>", "<Cmd>BufferLineCyclePrev<CR>", opts)
    vim.keymap.set("n", "<C-j>", "<Cmd>BufferLineCycleNext<CR>", opts)
  end,
}
