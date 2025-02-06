local vscode = require("utils").vscode_check

return {
  "shellRaining/hlchunk.nvim",
  cond = vscode,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = { enable = true },
      indent = { enable = true },
      line_num = { enable = true },
    })
  end,
}
