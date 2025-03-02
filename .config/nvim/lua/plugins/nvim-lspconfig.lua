local vscode = require("utils").vscode_check

return {
  "neovim/nvim-lspconfig",
  cond = vscode,
  config = function()
    local keymap = vim.keymap.set
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        -- 宣言ジャンプ
        keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        -- 実装ジャンプ
        keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        -- 参照元ジャンプ
        keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
        -- formatting
        keymap("n", "<leader>fo", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        -- rename
        keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
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
