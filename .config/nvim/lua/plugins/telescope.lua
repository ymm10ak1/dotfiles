local vscode = require("utils").vscode_check

return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  cond = vscode,
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  -- keys {{{
  keys = {
    { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Telescope Find_files" },
    { "<leader>gl", "<Cmd>Telescope live_grep<CR>", desc = "Telescope Live_grep" },
    {
      "<leader>gL",
      "<Cmd>Telescope live_grep grep_open_files=true<CR>",
      desc = "Telescope Live_grep(grep_open_files = true)",
    },
    { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Telescope Buffers" },
    { "<leader>fi", "<Cmd>Telescope file_browser hidden=true<CR>", desc = "Telescope FileBrowser" },
    { "<leader><leader>", "<Cmd>Telescope smart_open<CR>", desc = "Telescope Smart_open" },
    { "<leader>rg", "<Cmd>Telescope registers<CR>", desc = "Telescope Registers" },
  },
  -- }}}
  -- opts {{{
  opts = function()
    local actions = require("telescope.actions")
    local actions_generate = require("telescope.actions.generate")
    local which_key_opts = {
      name_width = 18,
      column_indent = 1,
    }
    local fb_actions = require("telescope").extensions.file_browser.actions
    -- local ignores = require("telescope._extensions.smart_open.default_config").ignore_patterns
    require("telescope").setup({
      -- defaults {{{
      defaults = {
        mappings = {
          i = {
            ["<C-/>"] = actions_generate.which_key(which_key_opts),
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-u>"] = false,
          },
          n = {
            ["q"] = actions.close,
            ["?"] = actions_generate.which_key(which_key_opts),
          },
        },
        path_display = {
          filename_first = { reverse_directories = false },
        },
        file_ignore_patterns = { "node_modules", "%.dotbackup/", "^.dotbackup/" },
      },
      pickers = {
        find_files = { hidden = true },
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telesscope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-/>"] = actions_generate.which_key(which_key_opts),
            },
            ["n"] = {
              ["?"] = actions_generate.which_key(which_key_opts),
              ["N"] = fb_actions.create,
            },
          },
        },
        -- smart_open = {
        --   match_algorithm = "fzf",
        --   ignore_patterns = vim.list_extend(ignores, { "*node_modules/*", "*.dotbackup/*" }),
        -- },
      },
      -- }}}
    })
    require("telescope").load_extension("fzf")
    -- require("telescope").load_extension("frecency")
    -- require("telescope").load_extension("file_browser")
    -- require("telescope").load_extension("smart_open")
  end, -- }}}
}
