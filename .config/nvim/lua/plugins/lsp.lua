local vscode = require("utils").vscode_check

return {
    "neovim/nvim-lspconfig",
    cond = vscode,
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
        local keymap = vim.keymap.set
        -- global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- エラーメッセージ表示(Diagnostic)
        -- keymap("n", "<leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>")
        -- 次のエラーメッセージを表示
        -- keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")
        -- 前のエラーメッセージを表示
        -- keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>")

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                -- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                -- ヒントを表示(hover)
                -- keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
                -- 定義ジャンプ
                -- keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
                -- 宣言ジャンプ
                keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                -- 実装ジャンプ
                keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                -- 参照元ジャンプ
                keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
                -- 型定義ジャンプ
                -- keymap("n", "gy", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
                -- formatting
                keymap("n", "<leader>fo", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                -- rename
                keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
                -- ErronnWarnig/Hintが出ている箇所で実行可能な修正の候補の表示
                -- keymap({ "n", "v" }, "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            end,
        })
    end,
}
