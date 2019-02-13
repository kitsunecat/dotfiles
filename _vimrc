

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')


" ファイルオープンを便利に
Plug 'Shougo/unite.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'

" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" Gitを便利に使う
Plug 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
Plug 'tpope/vim-endwise'

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" less用のsyntaxハイライト
" Plug 'KohPoll/vim-less'

" RubyMineのように自動保存する
Plug '907th/vim-auto-save'
let g:auto_save = 1

let g:auto_save = 1

call plug#end()

" Required:
filetype plugin indent on
set synmaxcol=200
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow