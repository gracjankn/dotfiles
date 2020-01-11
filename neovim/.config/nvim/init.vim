"Load plugins
call plug#begin()

	" Color scheme
	Plug 'connorholyday/vim-snazzy'

	" Status bar
	Plug 'itchyny/lightline.vim'

	" Provides name of current git branch (for use with other plugins - like Lightline)
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
\ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
\ }
