return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-frecency.nvim",
			event = { "BufReadPre", "BufNewFile" },
		},
		{
			"nvim-telescope/telescope-file-browser.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = {
		{ "<leader>ff", desc = "find_files" },
		{ "<leader>lg", desc = "live_grep" },
		{ "<leader>kg", desc = "live_grep(grep_open_files = true)" },
		{ "<leader>bb", desc = "buffers" },
		{ "<leader>ht", desc = "help_tags" },
		{ "<leader>gf", desc = "git_files" },
		{ "<leader>re", desc = "registers" },
		{ "<leader>nf", desc = "Telescope notify" },
		{ "<leader><leader>", desc = "Telescope Frecency" },
		{ "<leader>fb", desc = "Telescope FileBrowser" },
	},
	config = function()
		local actions = require("telescope.actions")
		local actions_generate = require("telescope.actions.generate")
		local fb_actions = require("telescope").extensions.file_browser.actions
		local themes = require("telescope.themes")
		local builtin = require("telescope.builtin")
		local trouble = require("trouble.providers.telescope")
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
						["<C-t>"] = trouble.open_with_trouble, -- <C-t>で結果をTroubleで開く
					},
					n = {
						["q"] = actions.close,
						["?"] = actions_generate.which_key(which_key_opts),
						["<C-t>"] = trouble.open_with_trouble, -- <C-t>で結果をTroubleで開く
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

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ hidden = true })
		end)
		vim.keymap.set("n", "<leader>lg", function()
			builtin.live_grep({})
		end)
		vim.keymap.set("n", "<leader>kg", function()
			builtin.live_grep({ grep_open_files = true })
		end)
		vim.keymap.set("n", "<leader>bb", function()
			builtin.buffers({})
		end)
		vim.keymap.set("n", "<leader>ht", function()
			builtin.help_tags({})
		end)
		vim.keymap.set("n", "<leader>gf", function()
			builtin.git_files({})
		end)
		vim.keymap.set("n", "<leader>re", function()
			builtin.registers({})
		end)
		vim.keymap.set("n", "<leader><leader>", ":Telescope frecency<CR>")
		vim.keymap.set("n", "<space>fb", ":Telescope file_browser hidden=true<CR>")
		vim.keymap.set("n", "<leader>nf", function()
			require("telescope").extensions.notify.notify(themes.get_dropdown({ height = 20 }))
		end)
	end,
}
