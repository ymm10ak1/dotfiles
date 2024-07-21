return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-frecency.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "danielfalk/smart-open.nvim",
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "find_files" },
        { "<leader>gl", "<cmd>Telescope live_grep<cr>", desc = "live_grep" },
        {
            "<leader>gL",
            "<cmd>Telescope live_grep grep_open_files=true<cr>",
            desc = "live_grep(grep_open_files = true)",
        },
        { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
        { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "help_tags" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "git_files" },
        { "<leader>re", "<cmd>Telescope registers<cr>", desc = "registers" },
        { "<leader>rr", "<cmd>Telescope frecency<cr>", desc = "Telescope Frecency" },
        { "<leader>rw", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope Frecency workspace" },
        { "<leader>fb", "<cmd>Telescope file_browser hidden=true<cr>", desc = "Telescope FileBrowser" },
        { "<leader>nf", "<cmd>Telescope notify theme=dropdown<cr>", desc = "Telescope notify" },
        { "<leader><space>", "<cmd>Telescope smart_open<cr>", desc = "Telescope smart_open" },
        { "<leader>fa", "<cmd>Telescope aerial<cr>", desc = "Telescope aerial" },
    },
    config = function()
        local actions = require("telescope.actions")
        local actions_generate = require("telescope.actions.generate")
        local fb_actions = require("telescope").extensions.file_browser.actions
        local trouble = require("trouble.sources.telescope")
        local which_key_opts = {
            name_width = 18,
            column_indent = 1,
        }
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-/>"] = actions_generate.which_key(which_key_opts),
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-t>"] = trouble.open, -- <C-t>で結果をTroubleで開く
                    },
                    n = {
                        ["q"] = actions.close,
                        ["?"] = actions_generate.which_key(which_key_opts),
                        ["<C-t>"] = trouble.open, -- <C-t>で結果をTroubleで開く
                    },
                },
                path_display = {
                    -- なぜか設定が反映されない
                    filename_first = {
                        reverse_directories = false,
                    },
                },
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
            },
        })
        require("telescope").load_extension("frecency")
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("notify")
        require("telescope").load_extension("smart_open")
        require("telescope").load_extension("aerial")
    end,
}
