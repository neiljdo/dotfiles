" General settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Themes
source $HOME/.config/nvim/themes/gruvbox.vim

" Plugin configurations
source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/startify.vim

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

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
    \ 'rebase': {
    \   'prompt': 'Rebase> ',
    \   'execute': 'echo system("{git} rebase {brach}")',
    \   'multiple': v:false,
    \   'keymap': 'ctrl-r',
    \   'required': ['branch'],
    \   'confirm': v:true,
    \ },
    \ 'track': {
    \   'prompt': 'Track> ',
    \   'execute': 'echo system("{git} checkout --track {branch}")',
    \   'multiple': v:false,
    \   'keymap': 'ctrl-t',
    \   'required': ['branch'],
    \   'confirm': v:true,
    \ }}


" LSP Config
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.html.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls_ms.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.sqlls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }

