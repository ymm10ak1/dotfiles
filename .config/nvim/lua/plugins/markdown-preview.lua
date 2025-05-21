return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = "markdown",
  keys = {
    { "<M-p>", "<Cmd>MarkdownPreviewToggle<CR>" },
  },
  build = "cp app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
