"Load plugins
call plug#begin()

	" Color scheme
	Plug 'connorholyday/vim-snazzy'

	" Status bar
	Plug 'itchyny/lightline.vim'

	" Provides name of current git repo (for use with other plugins - like Lightline)
	Plug 'itchyny/vim-gitbranch'

	" Comment a line with gcc or visual selection with gc
	Plug 'tpope/vim-commentary'

	" Quickly change surrounding characters
	
	Plug 'tpope/vim-surround'

	" Syntax for i3 config
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

" Syntax for i3 config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
