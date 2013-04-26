" Manage default tabs with spaces and clean up bad stuff.
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
retab

" Disable comment continuation
set formatoptions-=cro

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

"sane cursor movement
nmap j gj
nmap k gk

" commands
nmap \l :setlocal number!<CR>

" Make vim quieter.
set visualbell

" File specific stuff
" json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" ruby spaces
autocmd BufRead,BufNewFile   *.rb setlocal ts=2 sts=2 sw=2

" Plugins
    " CntrlP.vim
    set runtimepath^=~/.vim/plugin/ctrlp.vim
