return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  keys = {
    { "<M-p>", "<Cmd>MarkdownPreviewToggle<CR>" },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
