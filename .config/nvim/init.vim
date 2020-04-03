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

	" Note-taking workflow
	Plug 'junegunn/fzf'
	Plug 'https://github.com/alok/notational-fzf-vim'

call plug#end()

"Auto-refresh files
set autoread | au CursorHold * checktime | call feedkeys("lh")

"Hybrid numbers
set nu rnu

"Make colors look cool
set termguicolors

au BufNewFile,BufRead */i3/config set filetype=i3config

" Show/hide NerdTree with keyboard shortcut
map <C-n> :NV <CR>

" Note-taking workflow
let g:nv_search_paths = ['/Users/gracjan/Library/Mobile\ Documents/com~apple~CloudDocs/Notes']
let g:nv_default_extension = '.md'
