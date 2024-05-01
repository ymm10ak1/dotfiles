" ========== settings ==========
set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set hlsearch " 検索後をハイライト表示
set ignorecase " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set laststatus=2
set hidden " バッファが編集中でもその他のファイルを開けるように
set noswapfile
set showcmd
set clipboard=unnamed,unnamedplus

" ========== keymap ==========
let g:mapleader = "\<Space>"
" バッファ移動
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>
" インデント
nnoremap < <<
nnoremap > >>
" タブ移動
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tx :tabclose<CR>
nnoremap <silent> th :tabp<CR>
nnoremap <silent> tl :tabn<CR>
" ウィンドウ移動
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
" 行の先頭/行末
nnoremap H ^ 
nnoremap L $
vnoremap H ^ 
vnoremap L $h

" インサートモードのとき"jj"でノーマルモードへ
inoremap <silent> jj <ESC>

syntax on

