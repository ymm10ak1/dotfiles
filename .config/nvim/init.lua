if vim.loader then
    vim.loader.enable()
end

if not vim.g.vscode then
    require("config.options")
    require("config.keymaps")
    require("config.autocmds")
else
    require("config.vscode")
end
require("config.lazy")
