return {
  "f-person/git-blame.nvim",
  event = "BufRead",
  opts = {
    enabled = true,
    message_templates = " <summary> • <date> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
}
