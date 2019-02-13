set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on     " required!


""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/dein/repos/github.com/kitsunecat/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('kitsunecat/dein.vim')
call dein#add('kitsunecat/vimproc.vim', {'build': 'make'})

" ファイルオープンを便利に
call dein#add('kitsunecat/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
call dein#add('kitsunecat/neomru.vim')
" ...省略

call dein#end()

" Required:
filetype plugin indent on
""""""""""""""""""""""""""""""