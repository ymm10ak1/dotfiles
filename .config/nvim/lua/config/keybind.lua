vim.g.mapleader = " " -- <leader>キーを半角スペース

-- vim.opt.keymap.set: 第1引数でどのmodeか指定する
-- n: normal, i: insert, v: visual, t: terminal
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- インデントを1段浅く/深く
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)
keymap("x", "<", "<gv", { noremap = true, silent = true, desc = "<で連続してインデント操作する" })
keymap("x", ">", ">gv", { noremap = true, silent = true, desc = ">で連続してインデント操作する" })
-- Lで行末に移動/Hでスペースを除く先頭に移動
keymap("n", "L", "$", opts)
keymap("v", "L", "g_", opts)
keymap({ "n", "v" }, "H", "^", opts)
-- バッファ移動
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprev<CR>", opts)
-- Quickfixリスト移動、ウィンドウを閉じる
keymap("n", "[q", ":cprevious<CR>", opts)
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "qw", ":cclose<CR>", opts)
-- タブ作成、削除、 移動
keymap("n", "<leader>ta", ":tabnew<CR>", opts)
keymap("n", "<leader>tx", ":tabclose<CR>", opts)
keymap("n", "<leader>tl", "gt", opts)
keymap("n", "<leader>th", "gT", opts)
-- sを無効にする
keymap("n", "s", "<NOP>")
-- ウィンドウ移動
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)
-- 画面分割 <C-u>はコマンドラインに記述されている文字をすべて削除する
keymap("n", "<leader>ss", ":<C-u>split<CR><C-w>j", opts)
keymap("n", "<leader>sv", ":<C-u>vsplit<CR><C-w>l", opts)
-- ZZ, ZQを無効化する
keymap("n", "ZZ", "<NOP>")
keymap("n", "ZQ", "<NOP>")
-- リドゥ
keymap("n", "U", "<C-r>", opts)
-- 全行コピー
keymap("n", "sy", "<Cmd>%y<CR>", opts)
-- 行末までコピー
keymap("n", "Y", "y$", opts)
keymap("n", "<leader>*", "*''cgn", { desc = "検索対象の文字列を編集" })
keymap(
  { "n", "x" },
  "x",
  [["_x]],
  { noremap = true, silent = true, desc = "レジスタに残さないように消去専用レジスタを使う" }
)
-- 表示行単位か普通の行単位にするかをv:countの値で決める
-- v:count: 最後に実行されたノーマルモードに渡されたカウント数
keymap({ "n", "x" }, "j", function()
  if vim.v.count == 0 then
    return "gj"
  else
    return "j"
  end
end, { noremap = true, expr = true, silent = true })
keymap({ "n", "x" }, "k", function()
  if vim.v.count == 0 then
    return "gk"
  else
    return "k"
  end
end, { noremap = true, expr = true, silent = true })
-- jjでインサートモードからノーマルモードに変更
keymap("i", "jj", "<Esc>", opts)
