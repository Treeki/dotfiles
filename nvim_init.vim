set completeopt=menuone,noinsert,noselect,preview
set hidden
set mouse=a
set termguicolors
set noshowmode
set nobackup
set nowritebackup
set tabstop=4
set shiftwidth=4
set noexpandtab
let mapleader="`"
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
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
set list lcs=tab:\▏\ 
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'OmniSharp/omnisharp-vim'

" Colour schemes
Plug 'junegunn/seoul256.vim'
"Plug 'mhinz/vim-janah'
Plug 'fenetikm/falcon'
Plug 'romgrk/doom-one.vim'
Plug 'ray-x/aurora'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
nmap <leader>rn <Plug>(coc-rename)

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

"let g:seoul256_background = 233
"colorscheme seoul256
colorscheme aurora

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

"Airline
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1

"Telescope
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))<cr>
nnoremap <Leader>g :lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({ winblend = 20 }))<cr>
nnoremap <Leader>b :lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ winblend = 20 }))<cr>
nnoremap <Leader>m :lua require'telescope.builtin'.man_pages(require('telescope.themes').get_dropdown({ winblend = 20 }))<cr>
nnoremap <Leader>v <cmd>CHADopen --always-focus<cr>

" OmniSharp
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_popup_options = {'winhl': 'Normal:NormalFloat' }
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}

autocmd CursorHold *.cs OmniSharpTypeLookup
autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
autocmd FileType cs xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)

