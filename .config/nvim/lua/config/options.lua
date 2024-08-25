local opt = vim.opt
local g = vim.g

-- 文字コードをutf-8にする
opt.encoding = "utf-8"
-- 保存時の文字コード
opt.fileencoding = "utf-8"
-- 読み込み時の文字コードの自動判別。左側が優先される
opt.fileencodings = { "utf-8", "euc-jp", "cp932", "sjis" }

-- 保存してないファイルがあるときでも別のファイルを開くことができる
opt.hidden = true
-- スワップファイルを作成しない
opt.swapfile = false
-- バックアップファイルを作成しない
opt.backup = false

-- ｢※｣などの記号を表示するためには"double"を設定
opt.ambiwidth = "single"
-- 行番号表示
opt.number = true
-- 相対行番号の表示
opt.relativenumber = true
-- 現在行のカーソルを非表示
opt.cursorline = false
-- 端末上でTrueColorが使えるようになる
opt.termguicolors = true
-- ステータスラインを常に最下部に表示
opt.laststatus = 3
-- マウス有効化
opt.mouse = "a"
-- テキストの折り返しを有効化
opt.wrap = true
-- 記号列(gitsignsの記号等を表示する列)を常に表示する
opt.signcolumn = "yes"

-- Tabキー押下時やインデントの際、半角スペースが挿入される
opt.expandtab = true
-- タブ文字をスペース何文字分で表示するか
opt.tabstop = 4
-- 自動インデントのときに何文字分のスペースでインデントを入れるか
-- 0にするとtabstopの値を使用
opt.shiftwidth = 4
-- 改行するとき前の行インデントから開始
opt.autoindent = true
-- 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
opt.smartindent = true

-- 検索結果をハイライト
opt.hlsearch = true
-- 検索時に入力するたびに検索するようになる
opt.incsearch = true
-- サーチ時に大文字小文字を区別しない
opt.ignorecase = true
-- 小文字で検索すると大文字小文字を区別しない
opt.smartcase = true

-- ヘルプの言語には日本語を優先
opt.helplang = { "ja", "en" }
-- コマンドラインモードで<Tab>キーでファイル名補完を有効にする
opt.wildmenu = true
-- 対応するカッコを表示
opt.showmatch = true
-- 入力中のコマンドを表示する
opt.showcmd = true

-- 新しいウィンドウを右に開く
opt.splitright = true
-- 新しいウィンドウを下に開く
opt.splitbelow = true

opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
    g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "xsel -bi",
            ["*"] = "xsel -bi",
        },
        paste = {
            ["+"] = "xsel -bo",
            ["*"] = function()
                return vim.fn.systemlist('xsel -bo | tr -d "\r"')
            end,
        },
        cache_enable = 1,
    }
end
