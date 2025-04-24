return {
  "aznhe21/actions-preview.nvim",
  event = "LspAttach",
  keys = {
    {
      "gra",
      function()
        require("actions-preview").code_actions()
      end,
      mode = { "n", "v" },
      desc = "Code Action",
    },
  },
  opts = {
    backend = { "snacks", "nui", "telescope", "minipick" },
    ---@type snacks.picker.Config
    snacks = { layout = { preset = "ivy" } },
  },
}
