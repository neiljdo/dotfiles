" Comments on settings copied from
" https://github.com/ChristianChiarulli/nvim/blob/master/general/settings.vim

syntax enable                                       " Enables syntax highlighting
filetype plugin indent on

set autoindent                                      " Good auto indent
set backspace=indent,eol,start
set clipboard+=unnamedplus                          " Copy paste between vim and everything else
set cmdheight=2                                     " More space for displaying messages
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
set cursorline                                      " Enable highlighting of the current line
set encoding=utf-8                                  " The encoding displayed
set expandtab                                       " Converts tabs to spaces
set exrc                                            " Enable reading *rc files in the current directory
set fileencoding=utf-8                              " The encoding written to file
set formatoptions-=cro                              " Stop newline continuation of comments
set guicursor=                                      " Disable cursor-styling
set guifont=Hack\ Nerd\ Font
set hidden                                          " Required to keep multiple buffers open multiple buffers
set incsearch
set iskeyword+=-
set mouse=a                                         " Enable mouse
set nobackup                                        " Recommended by coc
set nocompatible
set noerrorbells
set nohlsearch
set noshowmode                                      " No need to see things like '-- INSERT --' anymore
set noswapfile
set nowrap                                          " Display long lines as just one line
set nowritebackup                                   " Recommended by coc
set number                                          " Show line numbers
set path=.,**
set pumheight=10                                    " Make popup menu smaller
set relativenumber
set ruler                                           " Show the cursor position all the time
set scrolloff=8                                     " Maintain distance from top/bottommost lines when scrolling
set signcolumn=yes                                  " Dedicated column for signs/icons
set shiftwidth=4                                    " Change the number of space characters inserted for indentation
set showtabline=2                                   " Always show tabs
set smartindent                                     " Makes indenting smart
set smarttab                                        " Makes tabbing smarter (will realize you need 2 vs 4)
set splitbelow                                      " Horizontal splits will automatically be below
set splitright                                      " Vertical splits will automatically be to the right
set tabstop=4 softtabstop=4                         " Insert 4 spaces for a tab
set termguicolors
set undodir=$HOME/.config/nvim/undodir
set undofile
set updatetime=50                                   " Faster completion

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
