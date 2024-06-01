return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-frecency.nvim",
            -- event = { "BufReadPre", "BufNewFile" },
        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
            -- event = { "BufReadPre", "BufNewFile" },
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "danielfalk/smart-open.nvim",
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "find_files" },
        { "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "live_grep" },
        {
            "<leader>lG",
            "<cmd>Telescope live_grep grep_open_files=true<cr>",
            desc = "live_grep(grep_open_files = true)",
        },
        { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
        { "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "help_tags" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "git_files" },
        { "<leader>re", "<cmd>Telescope registers<cr>", desc = "registers" },
        -- { "<leader><leader>", "<cmd>Telescope frecency<cr>", desc = "Telescope Frecency" },
        { "<leader>fb", "<cmd>Telescope file_browser hidden=true<cr>", desc = "Telescope FileBrowser" },

        {
            "<leader>nf",
            function()
                require("telescope").extensions.notify.notify(require("telescope.themes").get_dropdown({ height = 30 }))
            end,
            desc = "Telescope notify",
        },
        { "<leader><leader>", "<cmd>Telescope smart_open<cr>", desc = "Telescope smart_open" },
    },
    config = function()
        local actions = require("telescope.actions")
        local actions_generate = require("telescope.actions.generate")
        local fb_actions = require("telescope").extensions.file_browser.actions
        -- local themes = require("telescope.themes")
        -- local builtin = require("telescope.builtin")
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

        -- vim.keymap.set("n", "<leader>ff", function()
        --     builtin.find_files({ hidden = true })
        -- end)
        -- vim.keymap.set("n", "<leader>lg", function()
        --     builtin.live_grep({})
        -- end)
        -- vim.keymap.set("n", "<leader>kg", function()
        --     builtin.live_grep({ grep_open_files = true })
        -- end)
        -- vim.keymap.set("n", "<leader>bb", function()
        --     builtin.buffers({})
        -- end)
        -- vim.keymap.set("n", "<leader>ht", function()
        --     builtin.help_tags({})
        -- end)
        -- vim.keymap.set("n", "<leader>gf", function()
        --     builtin.git_files({})
        -- end)
        -- vim.keymap.set("n", "<leader>re", function()
        --     builtin.registers({})
        -- end)
        -- vim.keymap.set("n", "<leader><leader>", ":Telescope frecency<CR>")
        -- vim.keymap.set("n", "<space>fb", ":Telescope file_browser hidden=true<CR>")
        -- vim.keymap.set("n", "<leader>nf", function()
        --     require("telescope").extensions.notify.notify(themes.get_dropdown({ height = 20 }))
        -- end)
    end,
}
