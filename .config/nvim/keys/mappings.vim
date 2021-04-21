" g Leader key
let mapleader=" "
nnoremap <Space> <Nop>

imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Remaps
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader><CR> :so $MYVIMRC<CR>


" Better nav for omnicomplete
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")
" <Tab>: completion
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Use Alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
nnoremap <leader>rp :resize 100<CR>

" Alternative to <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <C-c> <esc>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Easy CAPS
inoremap <C-M-u> <Esc>viwUI
nnoremap <C-M-u> viwU<Esc>

" Tab in general mode will move to next buffer
nnoremap <Tab> :bnext<CR>
" Shift+Tab wil go back
nnoremap <S-Tab> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv-gv
vnoremap K :m '<-2<CR>gv-gv

" Yanking
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Git-related
nnoremap <leader>gc :GBranches<CR>

" YCM Remaps
" nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" LSP Remaps
" nnoremap <leader>va :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>

