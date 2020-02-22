"*****************************************************************************
" 文字コード指定
"*****************************************************************************
:set fileencodings=utf-8,cp932,euc-jp,sjis " ファイルを読み込む時の、文字コード自動判別の順番
:set encoding=utf-8 " vimの内部文字コード　（これを書くと、上記の優先度設定が無視されます）
:set fileformat=unix " ファイルのエンコーディング（改行コードの種類）

"*****************************************************************************
" インデント
"*****************************************************************************
:set number " 行番号を表示
:set shiftwidth=2 "tabstopと同じ値にしておけばよい
:set tabstop=2
:set expandtab
:set softtabstop=2
:set autoindent  "autoindentを有効にする
:set cindent
:set tags+=~/.tags  "ctags

"*****************************************************************************
" NERDTree
"*****************************************************************************
"autocmd vimenter * NERDTree

"*****************************************************************************
" コード補完
"*****************************************************************************
let g:rsenseUseOmniFunc = 1

"*****************************************************************************
" EMACSキーマップ設定
"*****************************************************************************
imap <C-c> <ESC>
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
inoremap <C-d> <Del>
imap <C-h> <BS>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable

set number
set ruler              "カーソル行が何行目何列目に置かれているか表示
set listchars=eol:¶,tab:_\
set cursorline         "カーソル行ハイライト
set laststatus=2       "ステータス行を常時表示
set title              "編集中のファイル名を表示する
set showmatch          "対応する括弧の強調表示
set matchtime=3        "showmatchの表示時間
set scrolloff=8        "上下の視界確保
set sidescrolloff=16   "左右の視界確保
set nostartofline      "移動コマンド使用時にカーソルを先頭に置かない

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Searching
set incsearch          "インクリメンタルサーチを行う
set hlsearch           "検索結果をハイライトする
set ignorecase         "検索時に文字の大小を区別しない
set smartcase          "検索時に大文字を含んでいたら大小を区別する
set wrapscan           "検索をファイルの先頭へループする

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')


" ファイル名をしてして検索
Plug 'ctrlpvim/ctrlp.vim'

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'

" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" Gitを便利に使う
Plug 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
Plug 'tpope/vim-endwise'

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" slimのシンタックスハイライト
Plug 'slim-template/vim-slim'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" javascript用のシンタックスハイライト
Plug 'jelera/vim-javascript-syntax'

" coffeescript用のシンタックスハイライト
Plug 'kchmck/vim-coffee-script'

" less用のsyntaxハイライト
" Plug 'KohPoll/vim-less'

" コード補完
Plug 'Shougo/neocomplete.vim'
Plug 'marcus/rsense'
Plug 'supermomonga/neocomplete-rsense.vim'

" メソッド定義元へのジャンプ
Plug 'szw/vim-tags'

" rubymineのように自動保存する
Plug '907th/vim-auto-save'
let g:auto_save = 1

" 自動でendを挿入
Plug 'kana/vim-smartinput'
Plug 'cohama/vim-smartinput-endwise'

" gitの差分箇所を表示
Plug 'airblade/vim-gitgutter'

call plug#end()

" Required:
filetype plugin indent on
set synmaxcol=200
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
