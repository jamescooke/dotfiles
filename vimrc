" TODO Switch out to vundle
runtime config/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('~/.vim/config/bundle/{}')

syntax on
set path=**                     " Search the files under the run location.
set suffixesadd=.py             " Look for Python files.

set ruler                       " set line number on the bar
set autoread                    " watch file for changes
set number
set nocompatible                " vim, not vi

set wildmode=full                   " go mental
set wildmenu                        " show complete options in menu
set wildignore=*.pyc                " ignore pyc files.
let g:netrw_list_hide= '.*\.pyc$'   " hide pyc files from file lists

set autoindent nosmartindent    " auto/smart indent
set smarttab
set expandtab                   " expand tabs to spaces
set shiftwidth=4
set softtabstop=4

set undolevels=1000
set shell=bash
set backspace=indent,eol,start
set history=250
set cursorline                  " underline where the cursor is

set backup                      " run the backups in the specified folder -
                                " must be made first.
set backupdir=~/.vim/backup
set undofile                    " Keep an undo file
set undodir=~/.vim/undo
set directory=~/.vim/tmp

set incsearch                   " Incremental searching
set hlsearch                    " Highlight search results
set ignorecase smartcase        " Case insensitive searching when the string
                                " is lower case
" Turn off highlighting when dropping into insert mode, and turn back on again
" when leaving
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

set list                        " Show all whiteshit chars
set listchars=eol:¬,tab:▷\ ,    " Show end of lines as '¬', tabs as arrows

filetype on
filetype indent on
filetype plugin on

" Open files - Whitespace below is important so you can type the file name
" directly after the ctrl+j
nnoremap <C-j> :tabe 

" Make jk work as escape
:inoremap jk <esc>
" Turn off escape to learn the new pattern
:inoremap <esc> <nop>

set colorcolumn=80              " Show the 80th char column.
highlight ColorColumn ctermbg=5
