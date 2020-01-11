"Load plugins
call plug#begin()

	Plug 'connorholyday/vim-snazzy'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'

call plug#end()

"Set enconding

"Hybrid numbers
set nu rnu

"Make colors look cool
colorscheme snazzy
set termguicolors

let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
