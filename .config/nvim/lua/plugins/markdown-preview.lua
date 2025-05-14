return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = "markdown",
  keys = {
    { "<M-p>", "<Cmd>MarkdownPreviewToggle<CR>" },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,

  -- https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2425301834
  init = function()
    vim.keymap.set("n", "<leader>mb", function()
      vim.cmd([[Lazy load markdown-preview.nvim]])
      vim.cmd([[Lazy build markdown-preview.nvim]])
    end, { desc = "markdown-preview.nvimに対してlazy loadとlazy buildを行う" })
  end,
}
