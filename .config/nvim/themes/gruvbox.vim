let g:gruvbox_invert_selection='1'
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" Force true colour on
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" highlight Normal guibg=none
highlight LineNr guifg=#458588
highlight qfFileName guifg=#aed75f
highlight Comment cterm=italic gui=italic ctermfg=244 guifg=#928374
