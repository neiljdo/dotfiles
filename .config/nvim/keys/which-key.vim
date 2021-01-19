" Timeout
let g:which_key_timeout = 100

" Map leader to which_key
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map = {}
" Define a separator
let g:which_key_sep = '→'

" Disable floating windows
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Single mappings
let g:which_key_map['/'] = [ ':call Comment()'                                  , 'comment' ]
let g:which_key_map['.'] = [ ':e $RC'                                           , 'open init.vm' ]
let g:which_key_map[';'] = [ ':Commands'                                        , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                                           , 'balance windows' ]
let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=file+'    , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                                           , 'split below' ]
let g:which_key_map['p'] = [ ':Files'                                           , 'search files' ]
" let g:which_key_map['T'] = [ ':Rg'                                              , 'search text' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                                  , 'undo tree' ]
let g:which_key_map['v'] = [ '<C-W>v'                                           , 'split right' ]

" Group mappings

" a is for actions
let g:which_key_map.a = {
    \ 'name': '+actions',
    \ 'e': [':CocCommand explorer'          , 'explorer'],
    \ }

" g is for git
let g:which_key_map.g = {
    \ 'name': '+git',
    \ 'a' : [':Git add .'                        , 'add all'],
    \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
    \ 'b' : [':Git blame'                        , 'blame'],
    \ 'B' : [':GBrowse'                          , 'browse'],
    \ 'c' : [':Git commit'                       , 'commit'],
    \ 'd' : [':Git diff'                         , 'diff'],
    \ 'D' : [':Gdiffsplit'                       , 'diff split'],
    \ 'g' : [':GGrep'                            , 'git grep'],
    \ 'G' : [':Gstatus'                          , 'status'],
    \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
    \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
    \ 'i' : [':Gist -b'                          , 'post gist'],
    \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
    \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
    \ 'l' : [':Git log'                          , 'log'],
    \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
    \ 'p' : [':Git push'                         , 'push'],
    \ 'P' : [':Git pull'                         , 'pull'],
    \ 'r' : [':GRemove'                          , 'remove'],
    \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
    \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
    \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
    \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
    \ 'v' : [':GV'                               , 'view commits'],
    \ 'V' : [':GV!'                              , 'view buffer commits'],
    \ }

" s is for search
let g:which_key_map.s = {
    \ 'name': '+search',
    \ '/': [':History/'                     , 'history'],
    \ ';': [':FzfPreviewCommandPalette'     , 'fzf preview commands'],
    \ 'c': [':Commits'                      , 'commits'],
    \ 'C': [':BCommits'                     , 'buffer commits'],
    \ 'f': [':Files'                        , 'files'],
    \ 'g': [':GFiles'                       , 'git files'],
    \ 'G': [':GFiles?'                      , 'modified git files'],
    \ 'h': [':History'                      , 'file history'],
    \ 'H': [':History:'                     , 'command history'],
    \ 'l': [':Lines'                        , 'lines'],
    \ 'M': [':Maps'                         , 'normal maps'],
    \ 'p': [':Helptags'                     , 'help tags'],
    \ 'P': [':Tags'                         , 'project tags'],
    \ 'S': [':Colors'                       , 'colorschemes'],
    \ 't': [':Rg'                           , 'text Rg'],
    \ 'w': [':Windows'                      , 'search windows'],
    \ 'y': [':Filetypes'                    , 'file types'],
    \ 'z': [':FZF'                          , 'FZF'],
    \ }

" S is for Session
let g:which_key_map.S = {
    \ 'name' : '+Session' ,
    \ 'c' : [':SClose'          , 'Close Session']  ,
    \ 'd' : [':SDelete'         , 'Delete Session'] ,
    \ 'l' : [':SLoad'           , 'Load Session']     ,
    \ 's' : [':Startify'        , 'Start Page']     ,
    \ 'S' : [':SSave'           , 'Save Session']   ,
    \ }

" Register which_key_map
call which_key#register('<Space>', "g:which_key_map")

