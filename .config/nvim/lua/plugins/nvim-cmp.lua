local vscode = require("utils").vscode_check

return {
  { "hrsh7th/cmp-nvim-lsp", cond = vscode, event = "InsertEnter" },
  { "hrsh7th/cmp-buffer", cond = vscode, event = { "InsertEnter", "CmdlineEnter" } },
  { "hrsh7th/cmp-cmdline", cond = vscode, event = { "CmdlineChanged", "ModeChanged", "CmdlineEnter" } },
  { "hrsh7th/cmp-path", cond = vscode, event = "InsertEnter" },
  { "saadparwaiz1/cmp_luasnip", cond = vscode, event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp-signature-help", cond = vscode, event = "InsertEnter" },
  { "onsails/lspkind.nvim", cond = vscode, event = "InsertEnter" },
  {
    "hrsh7th/nvim-cmp",
    cond = vscode,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "L3MON4D3/LuaSnip", event = "InsertEnter" },
      -- { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
      -- { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
      -- { "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
      -- { "hrsh7th/cmp-buffer", event = "InsertEnter" },
      -- { "hrsh7th/cmp-path", event = "InsertEnter" },
      -- { "hrsh7th/cmp-cmdline", event = { "ModeChanged", "CmdlineChanged" } },
      -- { "onsails/lspkind.nvim", event = "InsertEnter" },
    },
    opts = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "c", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "c", "s" }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "c", "s" }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "c", "s" }),
          ["<C-u>"] = cmp.mapping(function(fallback)
            if cmp.visible_docs() then
              cmp.scroll_docs(-4)
            else
              fallback()
            end
          end, { "i" }),
          ["<C-d>"] = cmp.mapping(function(fallback)
            if cmp.visible_docs() then
              cmp.scroll_docs(4)
            else
              fallback()
            end
          end, { "i" }),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
          }),
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          {
            name = "buffer",
            option = {
              keyword_length = 2,
            },
          },
        }),
        formatting = {
          format = function(entry, item)
            local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
            item = lspkind.cmp_format({
              mode = "symbol",
              maxwidth = 50,
              ellipsis_char = "...",
              show_labelDatails = true,
            })(entry, item)
            if color_item.abbr_hl_group then
              item.kind_hl_group = color_item.abbr_hl_group
              item.kind = color_item.abbr
            end
            return item
          end,
        },
        performance = {
          debounce = 0,
          throttle = 0,
        },
      })

      -- `/, ?` cmdline setup
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {
            name = "buffer",
            option = {
              keyword_length = 1,
            },
          },
        },
      })

      -- `:` cmdline setup
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
        matching = { disallow_symbol_noprefix_matching = false },
      })
    end,
  },
}
