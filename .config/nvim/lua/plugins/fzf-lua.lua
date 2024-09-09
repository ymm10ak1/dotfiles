local vscode = require("utils").vscode_check

return {
    "ibhagwan/fzf-lua",
    cond = vscode,
    cmd = "FzfLua",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>fp",
            function()
                require("fzf-lua").files({})
            end,
            desc = "Fzf Files",
        },
    },
    config = function()
        require("fzf-lua").setup({
            fzf_opts = { ["--layout"] = "reverse-list" },
            winopts = { preview = { layout = "vertical" } },
            -- keymap = {
            --     builtin = {
            --         ["<C-/>"] = "toggle-help",
            --         ["<C-d>"] = "preveiw-page-down",
            --         ["<C-u>"] = "preveiw-page-up",
            --     },
            -- },
            files = { formatter = "path.filename_first" },
        })
    end,
}
