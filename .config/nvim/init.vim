"Load plugins
call plug#begin()

	Plug 'tpope/vim-commentary' "Comment a line with gcc or visual selection with gc
	Plug 'cespare/vim-toml' "Syntax for toml

call plug#end()

set nu rnu "Hybrid numbers
set termguicolors "Improve color rendering
set clipboard=unnamedplus "Use system clipboard

"Custom status bar - left side
set statusline+=%#Type#
set statusline+=\ %m
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F

"Custom status bar - right side
set statusline+=%=%#Identifier#
set statusline+=\ %c:%l:%L
set statusline+=\ %p%%
set statusline+=\ %n

"Restore terminal cursor when exiting NeoVim
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \lCursor
  \,sm:block
au VimLeave,VimSuspend * set guicursor=a:hor100

" set autoread | au CursorHold * checktime | call feedkeys("lh") "Auto-refresh files

au BufNewFile,BufRead */i3/config set filetype=i3config "Recognize i3 config

map Q <nop>
