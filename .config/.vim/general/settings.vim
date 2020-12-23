" Set leader key
let g:mapleader = "\<Space>"

syntax on
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set cursorline
set encoding=utf-8
set expandtab
set exrc
set fileencoding=utf-8
set guicursor=
set hidden
set incsearch
set mouse=a
set nobackup
set noerrorbells
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set nu
set path=.,**
set relativenumber
set ruler
set scrolloff=8
set signcolumn=yes
set shiftwidth=4
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=4 softtabstop=4
set termguicolors
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms=4s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

set colorcolumn=80

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" Colorscheme
colorscheme gruvbox
set background=dark

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

highlight ColorColumn ctermbg=0 guibg=grey
" highlight Normal guibg=none
highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

