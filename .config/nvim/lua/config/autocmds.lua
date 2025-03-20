local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- 特定のファイルのインデントを2にする
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "js", "javascript", "ts", "typescript", "json", "markdown", "sh", "lua", "zsh" },
  group = augroup("indent2file"),
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- ターミナルを開いたらインサートモード
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = { "*" },
  group = augroup("termopen-insert"),
  callback = function()
    local opts = { buffer = 0 }
    -- escでノーマルモードに戻る
    vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], opts)
    vim.cmd("startinsert")
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- vimgrepの後にcw[indow]を入力すると検索結果の一覧が表示される(vim { pattern } { file } | cw)
-- QuickFixCmdPost: QuickFixコマンドを実行した後
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = { "*grep*" },
  group = augroup("qf-cwindow"),
  command = "cwindow",
})

-- helpなどをqで閉じるようにする
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "checkhealth", "qf", "notify", "startuptime" },
  group = augroup("qclose"),
  callback = function(ev)
    -- help等の対象ファイルをバッファリストに入れない
    vim.bo[ev.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { noremap = true, buffer = 0 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "lua" },
  group = augroup("fold-markder"),
  callback = function()
    vim.opt_local.foldmethod = "marker"
  end,
})
