return {
  "lambdalisue/kensaku-search.vim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "lambdalisue/kensaku.vim",
    "vim-denops/denops.vim",
  },
  config = function()
    vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = true })
  end,
}
