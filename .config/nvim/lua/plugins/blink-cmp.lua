return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_next()
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_prev()
          end
        end,
        "fallback",
      },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-p>"] = { "scroll_documentation_up", "fallback" },
      ["<C-n>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_and_accept()
          end
        end,
        "fallback",
      },
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
      min_keyword_length = function(ctx)
        -- 英小文字2文字まで補完をオフにする
        if ctx.mode == "cmdline" and string.find(ctx.line, "^%l+$") ~= nil then
          return 3
        end
        return 0
      end,
    },
    cmdline = {
      completion = {
        ghost_text = { enabled = false },
        menu = {
          auto_show = function(_)
            return vim.fn.getcmdtype() == ":"
          end,
        },
        list = { selection = { preselect = false, auto_insert = true } },
      },
      keymap = {
        preset = "cmdline",
        ["<C-n>"] = {},
        ["<C-p>"] = {},
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        -- ["<CR>"] = { "accept_and_enter", "fallback" },
      },
    },
    completion = {
      documentation = { auto_show = true },
      list = { selection = { preselect = false, auto_insert = true } },
    },
  },
}
