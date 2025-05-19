return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("plugins.lsp.diagnostics")
    require("plugins.lsp.attach")

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim", "Snacks" } },
          format = { enable = false },
          hint = { enable = true },
        },
      },
    })

    vim.lsp.config("clangd", {
      filetypes = { "c", "cpp" },
    })

    vim.lsp.config("pyright", {
      -- ruffを使うのでpyrightのimport文の自動ソートとanalysisを無効
      settings = { pyright = { disableOrganizeImports = true } },
      python = { analysis = { igenore = { "*" } } },
    })

    vim.lsp.config("bashls", {
      -- settings = {
      --   bashIde = {
      --     globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command|.zsh)",
      --   },
      -- },
      filetypes = { "bash", "sh", "zsh" },
    })

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "bashls", "clangd", "pyright", "ruff" },
    })

    -- {{{ Mason v2でmason-lspconfigのsetup_handler()が削除されたのでコメントアウト
    -- local lspconfig = require("lspconfig")
    -- local capabilities = require("blink.cmp").get_lsp_capabilities()
    --
    -- require("mason-lspconfig").setup_handlers({
    --   function(server_name) -- default handler
    --     lspconfig[server_name].setup({ capabilities = capabilities })
    --   end,
    --   -- 特定のLSPの設定
    --   ["lua_ls"] = function()
    --     lspconfig.lua_ls.setup({
    --       settings = {
    --         Lua = {
    --           diagnostics = { globals = { "vim", "Snacks" } },
    --           -- styluaを適用するため無効
    --           format = { enable = false },
    --           hint = { enable = true },
    --         },
    --       },
    --     })
    --   end,
    -- })
    -- }}}

    local null_ls = require("null-ls")
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "textlint", "markdownlint", "prettierd" },
      -- null_lsのsourcesの中から対応するmasons_toolsがあれば自動でインストールするか
      automatic_installation = false,
      handlers = {
        prettierd = function(_, _)
          null_ls.register(null_ls.builtins.formatting.prettierd.with({
            disabled_filetypes = { "markdown" },
          }))
        end,
      },
    })
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2", "-ci", "-bn" },
        }),
        -- null_ls.builtins.formatting.prettierd.with({
        --   disabled_filetypes = { "markdown" },
        -- }),
      },
    })
  end,
}
