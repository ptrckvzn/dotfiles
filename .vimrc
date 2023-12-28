set encoding=utf-8
set autowrite
set backspace=2
set nocompatible
set clipboard=unnamed
set nojoinspaces
"set laststatus=2
set wildmenu
set wildmode=longest:full,full
set mouse=a
set nomodeline
set modelines=0
set number
set numberwidth=5
set ruler
set splitbelow
set splitright
set showcmd
set showmode
set nostartofline
set shortmess=atI
set scrolloff=3

set swapfile
set backup
set undofile
let &directory = expand('~/.vim/swap//')
let &backupdir = expand('~/.vim/backup//')
let &undodir = expand('~/.vim/undo//')
if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

let mapleader = ','

call plug#begin()
  Plug 'wojciechkepka/vim-github-dark'
call plug#end()

colorscheme ghdark

syntax on

filetype plugin indent on

" Edit .vimrc in a new tab
nmap <Leader>ev :tabedit $HOME/.vimrc<cr>

set hlsearch
set incsearch
" Remove highlighted searches
nmap <Leader><space> :nohlsearch<cr>

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

augroup vimrc
  autocmd!

  " Source .vimrc after write
  autocmd BufWritePost .vimrc source %

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END
