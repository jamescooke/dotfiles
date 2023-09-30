set nocompatible                " vim, not vi
filetype off

call plug#begin()
Plug 'airblade/vim-gitgutter'       " Git indicators in the gutter
Plug 'chase/vim-ansible-yaml'
Plug 'christoomey/vim-tmux-runner'  " Run jobs in tmux splits
Plug 'gorkunov/smartpairs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'           " All the git ':G' goodness
Plug 'tpope/vim-rhubarb'            " GBrowse plugin for fugitive
Plug 'tpope/vim-unimpaired'         " Navigations pairs like ']f', '[f'
Plug 'tpope/vim-vinegar'            " Better directory browser via '-'
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

set updatetime=100              " Quicker update for gitgutter

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

" === Colour rules ===

set colorcolumn=80              " Show the 80th char column.
highlight ColorColumn ctermbg=5

" Turn off vim-gitgutter's sign column
highlight! link SignColumn LineNr

" Check spelling settings on a colour config:
" `:verbose highlight SpellBad`
" Fix bad spelling highlight in RST files: default bg colour is too light.
" 5 = fg colour of markdown titles and links
" 4 = blue like this text. Hard to read purple on blue.
" 3 = yellow
highlight SpellBad ctermbg=3

" Set space as leader
let mapleader = " "

filetype on
filetype indent on
filetype plugin on

" Turn on spelling for gitcommit messages, markdown, rst and LaTeX, spelling
" turned on for Ledger in its own section below
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType mkd setlocal spell
autocmd FileType rst setlocal spell
autocmd FileType tex setlocal spell

" Spelling and pasting switches using leader:
map <leader>p :set spell!<cr>
map <leader>P :set paste!<cr>

" === Plugin settings ===

" --- Ctags / tags ---
" Temporary work around for adding tags location. See
" https://github.com/jamescooke/dotfiles/issues/7
:set tags^=./.git/tags;

" --- Fugitive ---
map <leader>G :G<cr>
" Search for files known to git is in FZF

" --- FZF ---
imap <c-x><c-o> <plug>(fzf-complete-line)
map <leader>a :Ag<cr>
" Search for word under cursor
map <leader>A :Ag <c-r><c-w><cr>
map <leader>b :Buffers<cr>
map <leader>F :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>

" --- undotree ---
nnoremap <leader>U :UndotreeToggle<cr>

" --- VTR: Vim Tmux Runner ---
let g:VtrOrientation = "h"                  " split to the right of current pane
let g:VtrPercentage = 50                    " use 50 % of the screen width
let g:vtr_filetype_runner_overrides = {
    \ 'python': 'pytest {file}',
    \ 'markdown': 'frogmouth {file}'
    \ }
" Send file to runner as above
map <leader>m :VtrOpenRunner<cr>:VtrSendFile<cr>
" If the runner pane is closed, then it might need resetting.
map <leader>M :VtrUnsetRunnerPane<cr>:VtrOpenRunner<cr>:VtrSendFile<cr>
" Close the runner pane
map <leader>d :VtrKillRunner<cr>
" Focus runner pane for hacking
map <leader>Q :VtrFocusRunner!<cr>

" === General shortcuts ===

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

" <leader>y = Format (yapf|black)
" <leader>f = Lint   (flake8)
" <leader>i = Import (isort)
" <leader>m = Make   (pytest, frogmouth, hledger) - handled by VTR

" --- python ---

" Prevent colon ':' from indenting the current line
" See https://stackoverflow.com/a/37889460/1286705
autocmd FileType python setlocal indentkeys-=<:>
" Format
autocmd FileType python nnoremap <leader>y :0,$!blapf<cr><C-o>
" Lint
autocmd FileType python map <buffer> <leader>f :call Flake8()<cr>
" Import
autocmd FileType python map <leader>i :Isort<cr>
command! -range=% Isort :<line1>,<line2>! isort -

" Lint -> Import -> Format
function! LintAllPython() abort
    silent !clear
    " Save the file
    write
    " Run `isort` on file - do this first because it's more tolerant of syntax
    " errors and can prevent flake8 from complaining extra lines etc.
    " * use '-quiet' for quiet output
    " * '%' for file in current buffer
    " TODO make newline work
    silent !echo "\nDoing isort..."
    execute "!isort --quiet " . bufname("%")
    if executable("yapf")
        silent !echo "\nDoing yapf..."
        execute "!yapf --in-place " . bufname("%")
    elseif executable("black")
        silent !echo "\nDoing black..."
        execute "!black --quiet " . bufname("%")
    else
        silent !echo "\n***NO LINTER FOUND***"
    endif
    " Update buffer with newly formatted file
    edit!
    " TODO make git gutter update after moving / isorting
    " call gitgutter#process_buffer(bufnr(''), 1)
    " Run flake8 on current file by using the provided 'Flake8' function
    call Flake8()
    " To see if flake8 failed, check if the quickfix list is open
    " This snippet from Reddit... use len() to get a truthy number for list
    if len(filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"'))
        " Found a quickfix list, exit
        redraw!
        return 1
    endif
endfunction

" Run LintAllPython function
" * <cr> to run the call
" * Second <cr> to press enter after isort
" * Third <cr> to press enter after black
autocmd FileType python nnoremap <leader>r :call LintAllPython()<cr><cr><cr>

" Macro: convert unittest assert equal to simple assert ==
let @e = '^cf(assert jkf,xi ==jkA�kbjkj'
" Macro: add a trace point with ipdb
let @i = 'Oimport ipdbipdb.set_trace()jk'

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
autocmd FileType ansible setlocal shiftwidth=2
autocmd FileType ansible setlocal softtabstop=2

" --- RST ---

" Set indentation to be 4 spaces, same as Python rather than 3
autocmd FileType rst setlocal shiftwidth=4
autocmd FileType rst setlocal softtabstop=4

" --- Ledger ---

autocmd BufRead,BufNewFile *.dat setfiletype ledger
autocmd FileType ledger setlocal comments=b:;
autocmd FileType ledger setlocal spell
