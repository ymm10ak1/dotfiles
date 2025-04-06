vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format("%s (%s: %s) ", diagnostic.message, diagnostic.source, diagnostic.code)
    end,
  },
})
