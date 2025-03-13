local vscode = require("utils").vscode_check

return {
  "neovim/nvim-lspconfig",
  cond = vscode,
  config = function()
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          return string.format("%s (%s: %s) ", diagnostic.message, diagnostic.source, diagnostic.code)
        end,
      },
    })
    local keymap = vim.keymap.set
    keymap("n", "<leader>go", vim.diagnostic.open_float)
    keymap("n", "[d", vim.diagnostic.goto_prev)
    keymap("n", "]d", vim.diagnostic.goto_next)
    -- カレントバッファにLSPが接続した場合(LspAttachイベント)にキーマップを定義する
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>fo", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        -- inlayHintの有効化
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.name == "clangd" then
          return
        end
        if client ~= nil and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable()
        end
      end,
    })
    vim.opt.completeopt = "menu,menuone,noselect"
  end,
}
