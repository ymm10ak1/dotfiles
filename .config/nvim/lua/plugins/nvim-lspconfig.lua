local vscode = require("utils").vscode_check

return {
  "neovim/nvim-lspconfig",
  cond = vscode,
  config = function()
    local keymap = vim.keymap.set
    keymap("n", "<leader>go", vim.diagnostic.open_float)
    keymap("n", "[d", vim.diagnostic.goto_prev)
    keymap("n", "]d", vim.diagnostic.goto_next)
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        keymap("n", "K", vim.lsp.buf.hover, opts)
        -- keymap("n", "ga", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>fo", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        -- inlayHintの有効化
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable()
        end
      end,
    })
    vim.opt.completeopt = "menu,menuone,noselect"
  end,
}
