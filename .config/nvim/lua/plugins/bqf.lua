return {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    config = function()
        require("bqf").setup({
            func_map = {
                split = "<C-s>",
            },
            filter = {
                fzf = {
                    action_for = { ["ctrl-s"] = "split" },
                },
            },
        })
    end,
}
