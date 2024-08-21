return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        -- stylua: ignore start
        { "s", mode = { "n", "x", "o" }, function () require("flash").jump() end, desc = "Flash" },
        { "r", mode = { "o" }, function () require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "x", "o" }, function () require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<C-s>", mode = { "c" }, function () require("flash").toggle() end, desc = "Toggle Flash Search" },
        -- stylua: ignore end
        {
            "<CR>",
            mode = { "n" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^",
                })
            end,
            desc = "Jump to a line",
        },
    },
}
