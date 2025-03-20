local vscode = require("utils").vscode_check

return {
  "MeanderingProgrammer/markdown.nvim",
  cond = vscode,
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- Mandatory
    -- "nvim-tree/nvim-web-devicons", -- Optional but recommended
  },
  keys = {
    { "<M-r>", "<Cmd>RenderMarkdown toggle<CR>" },
  },
  ---@module "rnder-markdown"
  ---@type render.md.UserConfig
  opts = {
    -- Markdownをデフォルトではレンダリングしない
    enabled = false,
    heading = {
      width = "block",
    },
    code = {
      width = "block",
    },
  },
}
