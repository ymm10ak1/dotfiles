-- 特定のファイル(html,css,js,...)ではインデントを2にする
local fileTypeIndent = vim.api.nvim_create_augroup("fileTypeIndent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "js", "javascript", "ts", "typescript", "json", "markdown", "sh" },
    group = fileTypeIndent,
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})

-- ターミナルを開いたらインサートモード
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = { "*" },
    callback = function()
        local opts = { buffer = 0 }
        -- escでノーマルモードに戻る
        vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], opts)
        vim.cmd("startinsert")
        vim.opt_local.number = false
    end,
})

-- vimgrepの後にcw[indow]を入力すると検索結果の一覧が表示される(vim { pattern } { file } | cw)
-- QuickFixCmdPost: QuickFixコマンドを実行した後
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = { "*grep*" },
    command = "cw",
})
