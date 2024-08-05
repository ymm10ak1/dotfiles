return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        -- stylua: ignore start
        { "s", mode = { "n", "x", "o" }, function () require("flash").jump() end, desc = "Flash" },
        { "r", mode = { "n", "x", "o" }, function () require("flash").remote() end, desc = "Remote Flash" },
        { "<C-s>", mode = { "c" }, function () require("flash").toggle() end, desc = "Toggle Flash Search" },
        -- stylua: ignore end
        {
            "<CR>",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = false, mode = "search", max_lenght = 0 },
                    lable = { after = { 0, 0 } },
                    pattern = "^",
                })
            end,
            desc = "jump to a line",
        },
    },
}
