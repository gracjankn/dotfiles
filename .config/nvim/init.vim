"Load plugins
call plug#begin()

<<<<<<< HEAD
	" Provides name of current git branch (for use with other plugins - like Lightline)
	Plug 'itchyny/vim-gitbranch'

	" Comment a line with gcc or visual selection with gc
	Plug 'tpope/vim-commentary'

	" Syntax for i3 config
	Plug 'mboughaba/i3config.vim'
=======
	Plug 'tpope/vim-commentary' "Comment a line with gcc or visual selection with gc
	Plug 'dag/vim-fish' "Syntax for fish config
	Plug 'mboughaba/i3config.vim' "Syntax for i3 config
>>>>>>> 2fea2d6 (Shortened NeoVim config comments)

call plug#end()

set nu rnu "Hybrid numbers
set termguicolors "Make colors look cool
set clipboard=unnamedplus "Use system clipboard

<<<<<<< HEAD
<<<<<<< HEAD
" Highlight selected line
set cursorline

" Custom status bar - left side
=======
map <C-N> :EditVifm .<CR>
map <C-S> :source ~/.config/nvim/init.vim<CR>

set cursorline

>>>>>>> 99ea081 (Changed lightline for a custom made status bar)
=======
"Custom status bar - left side
>>>>>>> f4f3c58 (Enabled line numbers in NeoVim)
set statusline+=%#Type#
set statusline+=\ %m
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F

<<<<<<< HEAD
<<<<<<< HEAD
" Custom status bar - right side
=======
>>>>>>> 99ea081 (Changed lightline for a custom made status bar)
=======
"Custom status bar - right side
>>>>>>> f4f3c58 (Enabled line numbers in NeoVim)
set statusline+=%=%#Identifier#
set statusline+=\ %c:%l:%L
set statusline+=\ %p%%
set statusline+=\ %n
<<<<<<< HEAD
=======

"Restore terminal cursor when exiting NeoVim
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \lCursor
  \,sm:block
au VimLeave,VimSuspend * set guicursor=a:hor100

set autoread | au CursorHold * checktime | call feedkeys("lh") "Auto-refresh files

<<<<<<< HEAD
"Set correct file type for i3 config to fix colors
au BufNewFile,BufRead */i3/config set filetype=i3config
<<<<<<< HEAD
>>>>>>> f4f3c58 (Enabled line numbers in NeoVim)
=======
=======
au BufNewFile,BufRead */i3/config set filetype=i3config "Recognize i3 config
>>>>>>> 2fea2d6 (Shortened NeoVim config comments)

map Q <nop>
>>>>>>> d956280 (Disabled entering ex mode in NeoVim)
