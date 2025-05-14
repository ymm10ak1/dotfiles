return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  -- ft = "markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- Mandatory
    -- "nvim-tree/nvim-web-devicons", -- Optional but recommended
  },
  keys = {
    { "<M-r>", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle RenderMarkdown" },
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
