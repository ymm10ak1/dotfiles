local M = {}

M.vscode_check = function()
  return not vim.g.vscode
end

return M
