local keymap = vim.keymap.set

local inlayhint_lsp = { "lua_ls" }

-- カレントバッファにLSPが接続した場合(LspAttachイベント)にキーマップを定義する
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { noremap = true, buffer = ev.buf }
    keymap("n", "<leader>go", vim.diagnostic.open_float, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>fo", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    keymap("n", "grn", vim.lsp.buf.rename, opts)

    -- inlayHintの有効化
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil and client:supports_method("textDocument/inlayHint") then
      for _, server_name in pairs(inlayhint_lsp) do
        if client.name == server_name then
          vim.lsp.inlay_hint.enable()
        end
      end
    end
  end,
})
vim.opt.completeopt = "menu,menuone,noselect"
