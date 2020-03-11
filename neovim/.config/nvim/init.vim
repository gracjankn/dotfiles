"Load plugins
call plug#begin()

	" Colors
	Plug 'connorholyday/vim-snazzy'
	Plug 'arcticicestudio/nord-vim'

	" Status bar
	Plug 'itchyny/lightline.vim'

	" File manager on the left side
	Plug 'preservim/nerdtree'

	" Provides name of current git branch (for use with other plugins - like Lightline)
	Plug 'itchyny/vim-gitbranch'

	" Comment a line with gcc or visual selection with gc
	Plug 'tpope/vim-commentary'

	" Quickly change surrounding characters
	
	Plug 'tpope/vim-surround'

	" Syntax for i3 config
	Plug 'mboughaba/i3config.vim'

call plug#end()

"Auto-refresh files
set autoread | au CursorHold * checktime | call feedkeys("lh")

"Hybrid numbers
set nu rnu

"Make colors look cool
" colorscheme nord
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

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/dotfiles/i3/.config/i3/config set filetype=i3config
aug end

" Show/hide NerdTree with keyboard shortcut
map <C-n> :NERDTreeToggle<CR>
