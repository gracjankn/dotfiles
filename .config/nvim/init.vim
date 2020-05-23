"Load plugins
call plug#begin()

	" Status bar
	Plug 'itchyny/lightline.vim'

	" Provides name of current git branch (for use with other plugins - like Lightline)
	Plug 'itchyny/vim-gitbranch'

	" Comment a line with gcc or visual selection with gc
	Plug 'tpope/vim-commentary'

	" Syntax for i3 config
	Plug 'mboughaba/i3config.vim'

call plug#end()

"Auto-refresh files
set autoread | au CursorHold * checktime | call feedkeys("lh")

"Hybrid numbers
set nu rnu

"Make colors look cool
set termguicolors

au BufNewFile,BufRead */i3/config set filetype=i3config
