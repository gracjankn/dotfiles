" Load plugins
call plug#begin()

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
" set nu rnu

"Make colors look cool
set termguicolors

"Set correct file type for i3 config to fix colors
au BufNewFile,BufRead */i3/config set filetype=i3config

"Restore terminal cursor when exiting NeoVim
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \lCursor
  \,sm:block

au VimLeave,VimSuspend * set guicursor=a:hor100

"Use system clipboard
set clipboard=unnamedplus

<<<<<<< HEAD
" Highlight selected line
set cursorline

" Custom status bar - left side
=======
map <C-N> :EditVifm .<CR>
map <C-S> :source ~/.config/nvim/init.vim<CR>

set cursorline

>>>>>>> 99ea081 (Changed lightline for a custom made status bar)
set statusline+=%#Type#
set statusline+=\ %m
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F

<<<<<<< HEAD
" Custom status bar - right side
=======
>>>>>>> 99ea081 (Changed lightline for a custom made status bar)
set statusline+=%=%#Identifier#

set statusline+=\ %c:%l:%L
set statusline+=\ %p%%
set statusline+=\ %n
