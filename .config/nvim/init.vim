" General settings
if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Themes
source $HOME/.config/nvim/themes/gruvbox.vim

" Plugin configurations
" source $HOME/.config/nvim/plug-config/barbar.vim
source $HOME/.config/nvim/plug-config/codi.vim
source $HOME/.config/nvim/plug-config/far.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/gitgutter.vim
source $HOME/.config/nvim/plug-config/git-messenger.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/lspconfig.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/nvim-tree.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/vim-commentary.vim

luafile $HOME/.config/nvim/lua/lsp/lspconfig.lua
luafile $HOME/.config/nvim/lua/lsp/julia-ls.lua
luafile $HOME/.config/nvim/lua/lsp/vim-ls.lua
luafile $HOME/.config/nvim/lua/lsp/tsserver-ls.lua
luafile $HOME/.config/nvim/lua/lsp/haskell-ls.lua
luafile $HOME/.config/nvim/lua/plugins/colorizer.lua
luafile $HOME/.config/nvim/lua/plugins/compe.lua
luafile $HOME/.config/nvim/lua/plugins/galaxyline.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-tree.lua
luafile $HOME/.config/nvim/lua/plugins/telescope.lua
luafile $HOME/.config/nvim/lua/plugins/treesitter.lua


let g:vim_be_good_log_file = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

" Since Neovim is always `nocompatible`,
" `matchparen` plugin is not available.
" Regardless, this explicitly prevents loading
" of the said plugin.
let loaded_matchparen = 1

let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_liststyle = 3
let g:netrw_localrmdir = 'rm -r'
let g:netrw_winsize = 15 

" LSP Config
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.html.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.pyls_ms.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.sqlls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }

