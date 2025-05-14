return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "folke/snacks.nvim", opts = { terminal = {} } },
  },
  event = "LspAttach",
  keys = {
    {
      "gra",
      function()
        require("tiny-code-action").code_action()
      end,
      mode = { "n", "v" },
      desc = "Code Action",
    },
  },
  opts = {
    backend = "delta",
    picker = { "snacks", opts = { layout = "ivy" } },
  },
}
