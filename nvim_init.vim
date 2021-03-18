set completeopt=menuone,noinsert,noselect
set hidden
set mouse=a
set termguicolors
set nobackup
set nowritebackup

set number
set signcolumn=number
set cmdheight=2
set updatetime=300
set shortmess+=c

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

"nnoremap <silent> <Left> :BufferPrevious<CR>
"nnoremap <silent> <Right> :BufferNext<CR>
nnoremap <silent> <Left> :BufferLineCyclePrev<CR>
nnoremap <silent> <Right> :BufferLineCycleNext<CR>

" COC
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:seoul256_background = 233
colorscheme seoul256

lua << EOF
--require'lspconfig'.pyright.setup{}
--require'lspconfig'.tsserver.setup{}
require'bufferline'.setup{
	options = {
		separator_style = "slant"
	}
}
EOF

"autocmd BufEnter * lua require'completion'.on_attach()

