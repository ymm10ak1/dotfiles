local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    lazy = true,
  },
}

local not_vscode = require("utils").vscode_check

if not_vscode then
  require("lazy").setup("plugins", opts)
else
  require("lazy").setup({
    spec = {
      { import = "plugins.mini" },
      { import = "plugins.hop" },
      { import = "plugins.nvim-hlslens" },
      { import = "plugins.comment" },
      { import = "plugins.dial" },
      { import = "plugins.flash" },
      { import = "plugins.camelcasemotion" },
    }
  })
end

