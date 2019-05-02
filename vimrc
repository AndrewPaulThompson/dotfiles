" VimPlug config
call plug#begin('~/.local/share/nvim/plugged')

"Navigate files in a sidebar
Plug 'scrooloose/nerdtree'

" JS Highlighting
Plug 'pangloss/vim-javascript'

" JSX Highlighting
Plug 'mxw/vim-jsx'

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

" Editor config
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Start NERDTree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

" CtrlP config
let g:ctrlp_show_hidden = 1

" Syntax & Theme
syntax enable
colorscheme monokai
set number

" Set default tab width to 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


