" Timeout
let g:which_key_timeout = 100
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

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

" Hide status line
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
  " \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ ':call Comment()'                                  , 'comment' ]
let g:which_key_map['?'] = [ ':NvimTreeFindFile'                                , 'find file' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                      , 'open init.vm' ]
let g:which_key_map[';'] = [ ':Commands'                                        , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                                           , 'balance windows' ]
let g:which_key_map['e'] = [ ':NvimTreeToggle'                                  , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                                           , 'split below' ]
let g:which_key_map['o'] = [ ':RnvimrToggle'                                    , 'open' ]
let g:which_key_map['p'] = [ ':Files'                                           , 'search files' ]
let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                  , 'treesitter highlight' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                                  , 'undo tree' ]
let g:which_key_map['v'] = [ '<C-W>v'                                           , 'split right' ]
let g:which_key_map['z'] = [ 'Goyo'                                             , 'zen' ]

" Group mappings

" a is for actions
let g:which_key_map.a = {
    \ 'name': '+actions',
    \ 'e': [':CocCommand explorer'          , 'explorer'],
    \ 'm': [':MarkdownPreview'              , 'markdown preview'],
    \ 'M': [':MarkdownPreviewStop'          , 'markdown preview stop'],
    \ 't': [':FloatermToggle'               , 'terminal'],
    \ 'v': [':Codi!!'                       , 'virtual repl toggle'],
    \ }

" b is for buffer
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ '>' : [':BufferMoveNext'        , 'move next'],
    \ '<' : [':BufferMovePrevious'    , 'move prev'],
    \ '1' : [':BufferGoto 1'          , 'buffer 1'],
    \ '2' : [':BufferGoto 2'          , 'buffer 2'],
    \ '3' : [':BufferGoto 3'          , 'buffer 3'],
    \ '4' : [':BufferGoto 4'          , 'buffer 4'],
    \ '5' : [':BufferGoto 5'          , 'buffer 5'],
    \ '6' : [':BufferGoto 6'          , 'buffer 6'],
    \ '7' : [':BufferGoto 7'          , 'buffer 7'],
    \ '8' : [':BufferGoto 8'          , 'buffer 8'],
    \ '9' : [':BufferGoto 9'          , 'buffer 9'],
    \ '0' : [':BufferGoto 0'          , 'buffer 0'],
    \ 'b' : [':BufferPick'            , 'pick buffer'],
    \ 'd' : [':Bdelete'               , 'delete-buffer'],
    \ 'D' : [':BufferOrderByDirectory', 'order by directory'],
    \ 'f' : ['bfirst'                 , 'first-buffer'],
    \ 'l' : ['blast'                  , 'last buffer'],
    \ 'L' : [':BufferOrderByLanguage' , 'order by language'],
    \ 'n' : ['bnext'                  , 'next-buffer'],
    \ 'p' : ['bprevious'              , 'previous-buffer'],
    \ '?' : ['Buffers'                , 'fzf-buffer'],
    \ }

" f is for find and replace
let g:which_key_map.f = {
    \ 'name' : '+find & replace' ,
    \ 'f' : [':Farr --source=vimgrep'    , 'file'],
    \ 'p' : [':Farr --source=rgnvim'     , 'project'],
    \ }

" g is for git
let g:which_key_map.g = {
    \ 'name': '+git',
    \ 'a' : [':Git add .'                        , 'add all'],
    \ 'b' : [':Git blame'                        , 'blame'],
    \ 'B' : [':GBrowse'                          , 'browse'],
    \ 'c' : [':Git commit'                       , 'commit'],
    \ 'd' : [':Git diff'                         , 'diff'],
    \ 'D' : [':Gdiffsplit'                       , 'diff split'],
    \ 'g' : [':GGrep'                            , 'git grep'],
    \ 'S' : [':Gstatus'                          , 'status'],
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
    \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
    \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
    \ 'v' : [':GV'                               , 'view commits'],
    \ 'V' : [':GV!'                              , 'view buffer commits'],
    \ }

" s is for search powered by telescope
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '.' : [':Telescope filetypes'                   , 'filetypes'],
      \ ';' : [':Telescope commands'                    , 'commands'],
      \ 'a' : [':Telescope lsp_code_actions'            , 'code_actions'],
      \ 'A' : [':Telescope builtin'                     , 'all'],
      \ 'b' : [':Telescope buffers'                     , 'buffers'],
      \ 'B' : [':Telescope git_branches'                , 'git branches'],
      \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'],
      \ 'c' : [':Telescope git_commits'                 , 'git_commits'],
      \ 'C' : [':Telescope git_bcommits'                , 'git_bcommits'],
      \ 'f' : [':Telescope find_files'                  , 'files'],
      \ 'F' : [':Telescope git_files'                   , 'git_files'],
      \ 'g' : [':Telescope tags'                        , 'tags'],
      \ 'G' : [':Telescope current_buffer_tags'         , 'buffer_tags'],
      \ 'h' : [':Telescope command_history'             , 'history'],
      \ 'H' : [':Telescope help_tags'                   , 'help_tags'],
      \ 'i' : [':Telescope media_files'                 , 'media files'],
      \ 'k' : [':Telescope keymaps'                     , 'keymaps'],
      \ 'l' : [':Telescope loclist'                     , 'loclist'],
      \ 'm' : [':Telescope marks'                       , 'marks'],
      \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
      \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
      \ 'O' : [':Telescope oldfiles'                    , 'oldfiles'],
      \ 'p' : [':Telescope fd'                          , 'fd'],
      \ 'P' : [':Telescope spell_suggest'               , 'spell_suggest'],
      \ 's' : [':Telescope git_status'                  , 'git_status'],
      \ 'S' : [':Telescope grep_string'                 , 'grep_string'],
      \ 't' : [':Telescope live_grep'                   , 'text'],
      \ 'y' : [':Telescope symbols'                     , 'symbols'],
      \ 'Y' : [':Telescope lsp_workspace_symbols'       , 'lsp_workspace_symbols'],
      \ 'r' : [':Telescope registers'                   , 'registers'],
      \ 'R' : [':Telescope reloader'                    , 'reloader'],
      \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
      \ 'u' : [':Telescope colorscheme'                 , 'colorschemes'],
      \ 'z' : [':Telescope current_buffer_fuzzy_find'   , 'buf_fuz_find'],
      \ } 

" S is for Session
let g:which_key_map.S = {
    \ 'name' : '+Session' ,
    \ 'c' : [':SClose'          , 'Close Session'],
    \ 'd' : [':SDelete'         , 'Delete Session'],
    \ 'l' : [':SLoad'           , 'Load Session'],
    \ 's' : [':Startify'        , 'Start Page'],   
    \ 'S' : [':SSave'           , 'Save Session'],
    \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'u' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" Register which_key_map
call which_key#register('<Space>', "g:which_key_map")

