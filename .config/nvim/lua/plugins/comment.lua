return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
		config = function()
			require("todo-comments").setup({
				vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { noremap = true }),
			})
		end,
	},
}
