return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
        --vim.opt.listchars:append "eol:↴"
        require("ibl").setup({})
    end,
}
