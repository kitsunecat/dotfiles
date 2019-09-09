set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" 行番号を表示
:set number
:set autoindent  "autoindentを有効にする
:set tabstop=2
:set shiftwidth=2 "tabstopと同じ値にしておけばよい
:set expandtab
:set cindent

" Rubyの定義元追跡ようのタグ作成コマンド
" :TagsGenerate!

" コード補完
let g:rsenseUseOmniFunc = 1

" キーマップ設定
imap <C-c> <ESC>
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
inoremap <C-d> <Del>
imap <C-h> <BS>
""""""""""""""""""""""""""""""
" タブカスタマイズ
""""""""""""""""""""""""""""""
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

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
