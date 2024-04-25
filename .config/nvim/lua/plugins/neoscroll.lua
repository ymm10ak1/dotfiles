return {
    "karb94/neoscroll.nvim",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("neoscroll").setup({})
        local t = {}
        -- syntax: t[keys] = {function, {function, arguments}}
        t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "50" } }
        t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "50" } }
        t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "50" } }
        t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "50" } }
        t["zz"] = { "zz", { "70" } }
        require("neoscroll.config").set_mappings(t)
    end,
}
