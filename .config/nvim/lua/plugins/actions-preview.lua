local vscode = require("utils").vscode_check

return {
  "aznhe21/actions-preview.nvim",
  cond = vscode,
  event = "LspAttach",
  keys = {
    {
      "ga",
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
