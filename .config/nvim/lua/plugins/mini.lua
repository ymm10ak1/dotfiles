return {
    "echasnovski/mini.nvim",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mini.surround").setup({
            mappings = {
                add = "sa", -- Normal ModeとVisual Modeのとき文字列を括弧やクォーテーションで囲む
                delete = "sd", -- 括弧やクォーテーションを削除
                find = "sf", -- 括弧やクォーテーションを探す(右方向)
                find_left = "sF", -- 括弧やクォーテーションを探す(左方向)
                highlight = "sh", -- 括弧やクォーテーションをハイライトする
                replace = "sr", -- 括弧やクォーテーションを別のものに置換する
                update_n_lines = "sn",
                suffix_last = "l",
                suffix_next = "n",
            },
        })
        vim.keymap.del("x", "sa")
        vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<cr>]])
        require("mini.pairs").setup({
            mode = { insert = true, command = false, terminal = false },
            mappings = {
                ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
                ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
                ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

                [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
                ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
                ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

                ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
                ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
                ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
            },
        })
    end,
}
