local vscode = require("utils").vscode_check

return {
    { "nvim-telescope/telescope-frecency.nvim", cond = vscode },
    { "nvim-telescope/telescope-file-browser.nvim", cond = vscode },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vscode },
    {
        "nvim-telescope/telescope.nvim",
        cond = vscode,
        branch = "0.1.x",
        cmd = "Telescope",
        -- dependencies = {
        --     "nvim-tree/nvim-web-devicons",
        --     "nvim-telescope/telescope-frecency.nvim",
        --     "nvim-telescope/telescope-file-browser.nvim",
        --     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        -- },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find_files" },
            { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live_grep" },
            {
                "<leader>fW",
                "<cmd>Telescope live_grep grep_open_files=true<cr>",
                desc = "Telescope Live_grep(grep_open_files = true)",
            },
            { "<leader>fs", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
            { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Telescope Git_files" },
            { "<leader>rr", "<cmd>Telescope frecency<cr>", desc = "Telescope Frecency" },
            { "<leader>rw", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope Frecency workspace" },
            { "<leader>fb", "<cmd>Telescope file_browser hidden=true<cr>", desc = "Telescope FileBrowser" },
            { "<leader>nf", "<cmd>Telescope notify theme=dropdown<cr>", desc = "Telescope Notify" },
            { "<leader><space>", "<cmd>Telescope smart_open<cr>", desc = "Telescope Smart_open" },
            { "<leader>fa", "<cmd>Telescope aerial<cr>", desc = "Telescope Aerial" },
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
                        filename_first = { reverse_directories = false },
                    },
                    file_ignore_patterns = { "node_modules", "%.dotbackup/" },
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
                    smart_open = {
                        match_algorithm = "fzf",
                        ignore_patterns = { "*.git/*", "*/tmp/*", "*/.dotbackup/*", ".dotbackup/*", "*/node_modules/*" },
                    },
                    frecency = {
                        path_display = { "filename_first" },
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
    },
}
