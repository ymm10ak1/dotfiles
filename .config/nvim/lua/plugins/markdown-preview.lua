local vscode = require("utils").vscode_check

return {
  "iamcco/markdown-preview.nvim",
  cond = vscode,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  keys = {
    { "<M-p>", "<Cmd>MarkdownPreviewToggle<CR>" },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
