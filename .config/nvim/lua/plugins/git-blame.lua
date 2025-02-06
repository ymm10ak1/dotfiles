local vscode = require("utils").vscode_check

return {
  "f-person/git-blame.nvim",
  cond = vscode,
  event = "BufRead",
  opts = {
    enabled = true,
    message_templates = " <summary> • <date> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
}
