return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
        --vim.opt.listchars:append "eol:↴"
        require("ibl").setup({
            whitespace = {
                remove_blankline_trail = true,
            },
        })
    end,
}
