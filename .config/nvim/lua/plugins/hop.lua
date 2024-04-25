return {
    'smoka7/hop.nvim',
    version = "*",
    event = "VeryLazy",
    opts = {},
    config = function ()
        local hop = require('hop')
        hop.setup{
            keys = 'etovxqpdygfblzhckisuran',
            quit_key = '<SPC>',
        }
        -- local directions = require('hop.hint').HintDirection
        -- vim.keymap.set('', 'f', function ()
        --     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        -- end, {remap=true})
        -- vim.keymap.set('', 'F', function ()
        --     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        -- end, {remap=true})
        -- vim.keymap.set('', 't', function ()
        --     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        -- end, {remap=true})
        -- vim.keymap.set('', 'T', function ()
        --     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        -- end, {remap=true})
        vim.keymap.set('n', '<leader><leader>j', ':HopLineStart<CR>')
        vim.keymap.set('n', '<leader>a', ':HopLine<CR>')
        vim.keymap.set('n', '<leader><leader>w', ':HopWord<CR>')
    end
}
