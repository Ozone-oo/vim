filetype plugin indent on
set softtabstop=4
set smartindent
set showmatch
set termguicolors
syntax enable
syntax on
set t_Co=256
set nocompatible

set noswapfile
set nobackup
set autoread
set autowrite
set confirm

" Line numbers
set number
set relativenumber
set ruler
set autowrite

" Indentation and tabs
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Appearance
set signcolumn=yes
set cursorline
set colorcolumn=80

" Backspace behavior
set backspace=indent,eol,start

" Split window behavior
set splitbelow
set splitright

" dw/diw/ciw treat dash-separated words as single word
set iskeyword+=-

" Keep cursor 8 lines from top/bottom
set scrolloff=8

set ttimeoutlen=0
" Cursor responsiveness
set updatetime=300

set laststatus=2

set shortmess=atI

set clipboard=unnamed

if has('nvim')
  set guicursor=n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20-blinkon100
else
  if $TERM_PROGRAM ==# 'iTerm.app'
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2;BlinkingCursorEnabled=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=1\x7"
    " Initialize cursor shape/color on startup
    augroup reset_iTerm_cursor_shape
    au!
    "autocmd VimEnter * startinsert | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
    augroup END
  else
    let &t_SI .= "\e[5 q" " SI = INSERT mode
    let &t_SR .= "\e[3 q" " SR = REPLACE mode
    let &t_EI .= "\e[1 q" " EI = NORMAL mode (ELSE)
    " Initialize cursor shape/color on startup
    augroup reset_cursor_shape
    au!
    "autocmd VimEnter * startinsert | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
    augroup END
    " Reset cursor when Vim exits:
    autocmd VimLeave * silent !echo -ne "\e[5 q"
  endif
endif
