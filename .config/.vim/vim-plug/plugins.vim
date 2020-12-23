call plug#begin('~/.vim/plugged')

" YouCompleteMe repo manually cloned because support
" for Mojave is no longer available
" Manually checked out the following commit for installation to push through
" (see https://github.com/ycm-core/YouCompleteMe/issues/3805#issuecomment-727643020)
Plug 'ycm-core/YouCompleteMe', { 'commit': '4e480a31' }

" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'

" Debugger Plugins
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'sheerun/vim-polyglot'
Plug 'jremmen/vim-ripgrep'
Plug 'lyuts/vim-rtags'

call plug#end()

