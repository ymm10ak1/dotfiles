local opt = vim.opt
local g = vim.g

-- ==================== options ====================
opt.tabstop = 4
opt.expandtab = true
opt.swapfile = false
opt.smartindent = true
opt.autoindent = true
opt.smartcase = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.helplang = "ja"

opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
    g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "xsel -bi",
            ["*"] = "xsel -bi",
        },
        paste = {
            ["+"] = "xsel -bo",
            ["*"] = function()
                return vim.fn.systemlist('xsel -bo | tr -d "\r"')
            end,
        },
        cache_enable = 1,
    }
end

-- ==================== keymaps ====================
g.mapleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true }

keymap("n", "L", "$", opts)
keymap("v", "L", "$h", opts)
keymap({ "n", "v" }, "H", "^", opts)
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)
keymap("n", "<leader><leader>", "<Cmd>lua require('vscode').call('workbench.action.quickOpen')<CR>")
keymap("n", "<leader>fo", "<Cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap("n", "<leader>h", "<Cmd>lua require('vscode').call('workbench.action.navigateLeft')<CR>")
keymap("n", "<leader>j", "<Cmd>lua require('vscode').call('workbench.action.navigateDown')<CR>")
keymap("n", "<leader>k", "<Cmd>lua require('vscode').call('workbench.action.navigateUp')<CR>")
keymap("n", "<leader>l", "<Cmd>lua require('vscode').call('workbench.action.navigateRight')<CR>")
keymap("n", "<leader>fe", "<Cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
keymap("n", "<leader>ft", "<Cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
keymap("n", "<leader>rr", "<Cmd>lua require('vscode').action('workbench.action.reloadWindow')<CR>")
keymap("n", "<leader>sn", "<Cmd>lua require('vscode').action('workbench.action.openSnippets')<CR>")
-- keymap("n", "<leader>fl", "<Cmd>lua require('vscode').action('workbench.view.extensions')<CR>")
