return {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
        require("mini.surround").setup({
            mappings = {
                add = "gsa", -- Normal ModeとVisual Modeのとき文字列を括弧やクォーテーションで囲む
                delete = "gsd", -- 括弧やクォーテーションを削除
                find = "gsf", -- 括弧やクォーテーションを探す(右方向)
                find_left = "gsF", -- 括弧やクォーテーションを探す(左方向)
                highlight = "gsh", -- 括弧やクォーテーションをハイライトする
                replace = "gsr", -- 括弧やクォーテーションを別のものに置換する
                update_n_lines = "gsn",
                suffix_last = "l",
                suffix_next = "n",
            },
        })
        -- nvim-surroundと同じようにVisual Modeのときは"S"で囲むようにする
        vim.keymap.del("x", "gsa")
        vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<cr>]], { noremap = true })
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
