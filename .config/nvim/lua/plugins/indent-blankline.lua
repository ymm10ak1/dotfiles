return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
        require("ibl").setup({})
    end,
}
