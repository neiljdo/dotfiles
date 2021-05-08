" Auto install vim-plug
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $RC
endif


call plug#begin('$HOME/.config/nvim/autoload/plugged')

  " YouCompleteMe repo manually cloned because support
  " for Mojave is no longer available
  " Manually checked out the following commit for installation to push through
  " (see https://github.com/ycm-core/YouCompleteMe/issues/3805#issuecomment-727643020)
  " Plug 'ycm-core/YouCompleteMe', { 'commit': '4e480a31' }

  " Commenting
  Plug 'tpope/vim-commentary'
  " Have the filesystem follow you around
  Plug 'airblade/vim-rooter'
  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/playground'
  Plug 'p00f/nvim-ts-rainbow'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Status Line
  Plug 'glepnir/galaxyline.nvim'
  " Ranger
  Plug 'kevinhwang91/rnvimr'
  " Terminal
  Plug 'voldikss/vim-floaterm'
  " Start screen
  Plug 'mhinz/vim-startify'
  " See what keys do
  Plug 'liuchengxu/vim-which-key'
  " Zen mode
  Plug 'junegunn/goyo.vim'
  " Interactive code
  Plug 'metakirby5/codi.vim'  
  " Better tabline
  Plug 'romgrk/barbar.nvim'
  " Find and replace
  Plug 'brooth/far.vim'
  " Smooth scroll
  Plug 'psliwka/vim-smoothie'
  " Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
  " Intuitive buffer closing
  Plug 'moll/vim-bbye'
  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-media-files.nvim'
  " Intellisense 
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  " Plug 'nvim-lua/completion-nvim'
  " Plug 'tjdevries/nlua.nvim'
  " Plug 'tjdevries/lsp_extensions.nvim'
  " File explorer
  Plug 'kyazdani42/nvim-tree.lua'
  " Colorscheme
  Plug 'gruvbox-community/gruvbox'
  " Better syntax support
  Plug 'sheerun/vim-polyglot'
  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'rhysd/git-messenger.vim'
  " Commenting
  Plug 'tpope/vim-commentary'
  " Undo time travel
  Plug 'mbbill/undotree'
  " Quickfix
  Plug 'kevinhwang91/nvim-bqf'
  " Colorizer
  Plug 'norcalli/nvim-colorizer.lua'

  " Cool icons - make this last
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'

  " From ThePrimeagen
  " TODO(neiljdo): Determine what these are for
  " and decide whether to keep or not
  " Plug 'leafgarland/typescript-vim'

  " Debugger Plugins
  " Plug 'puremourning/vimspector'
  " Plug 'szw/vim-maximizer'

  " Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " Plug 'kien/ctrlp.vim'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  " Plug 'stsewd/fzf-checkout.vim'
  " Plug 'theprimeagen/vim-be-good'
  " Plug 'vim-utils/vim-man'
  " Plug 'jremmen/vim-ripgrep'
  " Plug 'lyuts/vim-rtags'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

