" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map = {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Disable floating windows
let g:which_key_use_floating_win=0

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ] 
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]

let g:which_key_map.s = {
    \ 'name': '+search',
    \ 'f': [':Files', 'files'],
    \ 't': [':Rg', 'text Rg'],
    \ }

" Register which_key_map
call which_key#register('<Space>', "g:which_key_map")

