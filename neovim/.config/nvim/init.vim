"Load plugins
call plug#begin()

	Plug 'connorholyday/vim-snazzy'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'mboughaba/i3config.vim'

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

" Syntax highligting for i3 config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
