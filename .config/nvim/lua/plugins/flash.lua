return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    -- stylua: ignore start
    { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = { "o" }, function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "x", "o" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    {
      "M", mode = { "n", "x", "o" },
      function()
        require("flash").jump({ jump = { pos = "end" } })
      end,
      desc = "Flash Backward search only",
    },
    -- stylua: ignore end
    {
      "[j",
      mode = { "n" },
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 1 },
          label = { after = { 0, 0 } },
          pattern = "^",
        })
      end,
      desc = "Jump to a line",
    },
  },
}
