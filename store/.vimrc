set nocompatible                " vim, not vi
filetype off

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'chase/vim-ansible-yaml'
Plug 'gorkunov/smartpairs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvie/vim-flake8'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
call plug#end()

syntax on
set path=**                     " Search the files under the run location.
set suffixesadd=.py             " Look for Python files.

set encoding=utf-8
set ruler                       " set line number on the bar
set autoread                    " watch file for changes
set number                      " Shows current line number, not just 0 (with relative)
set relativenumber              " Use 'newish' relative line numbering

set showcmd                         " Show current command in bottom bar
set wildmode=longest,full           " Complete more readline-like. Longest
                                    " first, then full tab complete.
set wildmenu                        " Show complete options in menu. IMO this
                                    " is a good replacement for 'list' in
                                    " wildmode.
set wildignore=*.pyc                " Ignore pyc files.
let g:netrw_list_hide= '.*\.pyc$'   " Hide pyc files from file lists.

set complete-=i                 " Do not use included files for completion

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

set diffopt+=vertical           " Force git diffs to be shown vertically, even
                                " on narrow windows.

" Turn off highlighting when dropping into insert mode, and turn back on again
" when leaving
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

set list                        " Show all whiteshit chars
set listchars=eol:¬,tab:▷\ ,    " Show end of lines as '¬', tabs as arrows

set nrformats-=octal            " Turn off octal increment / decrement so that
                                " numbers with leading zeros won't go from 007
                                " to 010

set foldlevel=99                " Open out all folds by default.

set colorcolumn=80              " Show the 80th char column.
highlight ColorColumn ctermbg=5

" Turn off vim-gitgutter's sign column
highlight! link SignColumn LineNr

let mapleader = " "             " Space as leader

filetype on
filetype indent on
filetype plugin on

" Turn on spelling for gitcommit messages, markdown, rst and LaTeX
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType mkd setlocal spell
autocmd FileType rst setlocal spell
autocmd FileType tex setlocal spell

" FZF settings
imap <c-x><c-o> <plug>(fzf-complete-line)
map <leader>a :Ag<cr>
map <leader>b :Buffers<cr>
map <leader>F :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>

" Ctags / tags
" Temporary work around for adding tags location. See
" https://github.com/jamescooke/dotfiles/issues/7
:set tags^=./.git/tags;


" Copy current visual to system clipboard
map <leader>c "+y
" Wrap line to paragraph
map <leader>w Vgq
" Turn off highlighting
map <leader>n :noh<cr>
" Next and previous tabs, double h is used because gitgutter hunks are on
" leader h, stops mistaken leader h combos changing the tab.
map <leader>hh gT
map <leader>l gt
" Sort selection or whole file
map <leader>s :sort<cr>
" Output today's date in reverse order
command! Today pu=strftime('%Y/%m/%d')
" Generate a UUID using shell
command! UUID read !uuidgen
" Make jk work as escape
:inoremap jk <esc>
" Turn off escape to learn the new pattern
:inoremap <esc> <nop>
" Turn off Ex mode
nnoremap Q <nop>

" === DEV PATTERNS ====

" leader f = Format (yapf|black)
" leader y = Lint   (flake8)
" leader i = Import (isort)
" leader k = Test   (pytest)

" --- python ---

" Format
autocmd FileType python nnoremap <leader>y :0,$!blapf<cr><C-o>
" Lint
autocmd FileType python map <buffer> <leader>f :call Flake8()<cr>
" Import
autocmd FileType python map <leader>i :Isort<cr>
command! -range=% Isort :<line1>,<line2>! isort -

" Macro: convert unittest assert equal to simple assert ==
let @e = '^cf(assert jkf,xi ==jkA�kbjkj'

" --- java family ---

" Set any Jenkinsfile* to be filetype=groovy
autocmd BufNewFile,BufRead Jenkinsfile* setfiletype groovy

" --- docker ---

" Set any Dockerfile* to be filetype=dockerfile
autocmd BufNewFile,BufRead Dockerfile* setfiletype dockerfile

" --- cucumber ---

" Set indentation to be 2 whitespaces
autocmd FileType cucumber setlocal shiftwidth=2
autocmd FileType cucumber setlocal softtabstop=2
autocmd FileType cucumber setlocal spell

" --- ansible ---

" Set indentation to be 2 whitespaces
autocmd FileType cucumber setlocal shiftwidth=2
autocmd FileType cucumber setlocal softtabstop=2
