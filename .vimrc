" Manage default tabs with spaces and clean up bad stuff.
set expandtab
set tabstop=2
set shiftwidth=2
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

" Show a vertical bar at column 121 and wrap text at 120
set colorcolumn=121
set textwidth=120

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
autocmd BufNewFile,BufRead *.json set ft=javascript ts=2

" ruby spaces
autocmd BufRead,BufNewFile   *.rb setlocal ts=2 sts=2 sw=2

" coffeescript
autocmd BufRead,BufNewFile   *.coffee setlocal ts=2 sts=2 sw=2

" Plugins
    " CntrlP.vim
    set runtimepath^=~/.vim/plugin/ctrlp.vim
    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<c-t>'],
        \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
        \ }

    " Pathogen
    call pathogen#infect()
