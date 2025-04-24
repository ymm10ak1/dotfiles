return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    enabled = true,
    lazy = false,
    config = function()
      vim.cmd([[colorscheme nightfox]])
    end,
  },
}
