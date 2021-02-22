set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/rainbow_parentheses.vim'

" Colour schemes
Plug 'junegunn/seoul256.vim'
"Plug 'mhinz/vim-janah'
Plug 'fenetikm/falcon'
Plug 'romgrk/doom-one.vim'

call plug#end()

" install: :PlugInstall
" update: :PlugUpdate
" remove stuff: :PlugClean

map z <Plug>Sneak_s
map Z <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nnoremap <silent> <Left> :BufferPrevious<CR>
nnoremap <silent> <Right> :BufferNext<CR>

let g:seoul256_background = 233
colorscheme seoul256

