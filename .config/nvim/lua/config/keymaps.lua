vim.g.mapleader = " " -- <leader>キーを半角スペース

-- vim.opt.keymap.set: 第1引数でどのmodeか指定する
-- n: normal, i: insert, v: visual, t: terminal
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- インデントを1段浅く/深く
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)
-- Visual <,>で連続してインデント操作
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)
-- Lで行末に移動/Hでスペースを除く先頭に移動
keymap("n", "L", "$", opts)
keymap("v", "L", "$h", opts)
keymap({ "n", "v" }, "H", "^", opts)
-- 行末までヤンク
keymap("n", "Y", "y$", opts)
-- バッファ移動
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprev<CR>", opts)
-- Quickfixリスト移動、ウィンドウを閉じる
keymap("n", "[q", ":cprevious<CR>", opts)
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "qw", ":cclose<CR>", opts)
-- タブ作成、削除、 移動
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tx", ":tabclose<CR>", opts)
keymap("n", "tl", "gt", opts)
keymap("n", "th", "gT", opts)
-- ウィンドウ移動
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)
-- 画面分割 <C-u>はコマンドラインに記述されている文字をすべて削除する
keymap("n", "ss", ":<C-u>split<CR><C-w>j", opts)
keymap("n", "sv", ":<C-u>vsplit<CR><C-w>l", opts)
-- ZZ, ZQを無効化する
keymap("n", "ZZ", "<NOP>")
keymap("n", "ZQ", "<NOP>")
-- リドゥ
keymap("n", "U", "<C-r>", opts)
-- insertモード中、jjでnormalモードに変更
keymap("i", "jj", "<Esc>", opts)
