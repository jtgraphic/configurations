" Manage tabs with spaces and clean up bad stuff.
set expandtab
set tabstop=4
set shiftwidth=4
retab

" Use line numbers.
set number

" Remember more.
set history=1000

" Make tab completion better.
set wildmenu
set wildmode=list:longest

" Give the cursor some room while scrolling.
set scrolloff=3

" Highlight searches.
set hlsearch
set incsearch

" Make / searching case-insensitive most of the time.
set ignorecase 
set smartcase

" Add syntax highlighting and general filetype options.
syntax on
filetype on
filetype plugin on
filetype indent on

" Make vim quieter.
set visualbell

" json syntax highlighting
    autocmd BufNewFile,BufRead *.json set ft=javascript

" Plugins
    " CntrlP.vim
    set runtimepath^=~/.vim/plugin/ctrlp.vim
