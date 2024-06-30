return {
    "MeanderingProgrammer/markdown.nvim",
    enabled = true,
    ft = { "markdown" },
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- Mandatory
        "nvim-tree/nvim-web-devicons", -- Optional but recommended
    },
    config = function()
        require("render-markdown").setup({})
    end,
}
