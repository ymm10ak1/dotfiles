return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "nvimtools/none-ls.nvim",
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("plugins.lsp.diagnostics")
    require("plugins.lsp.attach")

    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "bashls", "clangd" },
    })
    require("mason-lspconfig").setup_handlers({
      function(server_name) -- default handler
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,
      -- 特定のLSPの設定
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = { globals = { "vim", "Snacks" } },
              -- styluaを適用するため無効
              format = { enable = false },
              hint = { enable = true },
            },
          },
        })
      end,
    })

    local null_ls = require("null-ls")
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "textlint", "markdownlint", "prettierd" },
      -- null_lsで選ばれたsourcesに基づいてmasons toolsを自動でインストールするか
      automatic_installation = false,
      handlers = {},
    })
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2", "-ci", "-bn" },
        }),
      },
    })
  end,
}
