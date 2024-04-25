return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufNewFile", "BufReadPre" },
    config = function()
        require("lualine").setup({
            options = {
                globalstatus = true,
            }
        })
    end,
}
