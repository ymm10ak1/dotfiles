return {
    "neovim/nvim-lspconfig",
    -- BufReadPre: 新しいバッファの編集を始めたとき、ファイルを読み込む前
    -- BufNewFile: 存在しないファイルの編集を始めたとき
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local keymap = vim.keymap.set
        -- global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- エラーメッセージ表示(Diagnostic)
        keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
        -- 次のエラーメッセージを表示
        keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
        -- 前のエラーメッセージを表示
        keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
        -- keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                -- ヒントを表示(hover)
                keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                -- 定義ジャンプ
                keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                -- 宣言ジャンプ
                keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                -- 実装ジャンプ
                keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                -- 参照元ジャンプ
                keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                -- 型定義ジャンプ
                keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
                -- formatting
                keymap("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                -- rename
                keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                -- ErronnWarnig/Hintが出ている箇所で実行可能な修正の候補の表示
                keymap({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            end,
        })
    end,
}
