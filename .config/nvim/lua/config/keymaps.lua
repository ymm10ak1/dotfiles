vim.g.mapleader = " " -- <leader>キーを半角スペース

-- vim.opt.keymap.set: 第1引数でどのmodeか指定する
-- n: normal, i: insert, v: visual, t: terminal
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- カレントウィンドウの下にターミナルを開き、ターミナルをインサートモードにする
-- keymap("n", "<leader>tt", ":split | wincmd j | resize 10 |terminal<CR>i", opts)
-- <Ctrl-q>でvisual(矩形選択)モードに変更
keymap("n", "<C-q>", "<C-v>", opts)
-- インデントを1段浅く/深く
keymap("n", "<", "<<", { noremap = true })
keymap("n", ">", ">>", { noremap = true })
-- Lで行末に移動/Hでスペースを除く先頭に移動
keymap("n", "L", "$", { noremap = true })
keymap("v", "L", "$h", { noremap = true })
keymap({ "n", "v" }, "H", "^", { noremap = true })
-- バッファ移動
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprev<CR>", opts)
-- vimgrepの検索結果の移動
keymap("n", "[q", ":cprevious<CR>", opts)
keymap("n", "]q", ":cnext<CR>", opts)
-- タブ作成、削除、 移動
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tx", ":tabclose<CR>", opts)
keymap("n", "gl", "gt", opts)
keymap("n", "gh", "gT", opts)
-- ウィンドウ移動
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
-- 画面分割 <C-u>はコマンドラインに記述されている文字をすべて削除する
keymap("n", "ss", ":<C-u>split<CR><C-w>w", opts)
keymap("n", "sv", ":<C-u>vsplit<CR><C-w>w", opts)
-- insertモード中、jjでnormalモードに変更
keymap("i", "jj", "<Esc>", opts)
-- ターミナルモード時に<ESC>押すとnormal
keymap("t", "<Esc>", "<C-\\><C-n><CR>", opts)
