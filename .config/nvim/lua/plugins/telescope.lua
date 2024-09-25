local vscode = require("utils").vscode_check

return {
    -- { "nvim-telescope/telescope-frecency.nvim", cond = vscode },
    -- { "nvim-telescope/telescope-file-browser.nvim", cond = vscode },
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vscode },
    {
        "nvim-telescope/telescope.nvim",
        cond = vscode,
        branch = "0.1.x",
        cmd = "Telescope",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-telescope/telescope-frecency.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Telescope Find_files" },
            { "<leader>fw", "<Cmd>Telescope live_grep<CR>", desc = "Telescope Live_grep" },
            {
                "<leader>fW",
                "<Cmd>Telescope live_grep grep_open_files=true<CR>",
                desc = "Telescope Live_grep(grep_open_files = true)",
            },
            { "<leader>fs", "<Cmd>Telescope buffers<CR>", desc = "Telescope Buffers" },
            { "<leader>gf", "<Cmd>Telescope git_files<CR>", desc = "Telescope Git_files" },
            { "<leader>rr", "<Cmd>Telescope frecency<CR>", desc = "Telescope Frecency" },
            { "<leader>rw", "<Cmd>Telescope frecency workspace=CWD<CR>", desc = "Telescope Frecency workspace" },
            { "<leader>fb", "<Cmd>Telescope file_browser hidden=true<CR>", desc = "Telescope FileBrowser" },
            { "<leader>nf", "<Cmd>Telescope notify theme=dropdown<CR>", desc = "Telescope Notify" },
            { "<leader><space>", "<Cmd>Telescope smart_open<CR>", desc = "Telescope Smart_open" },
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
        end,
    },
}
