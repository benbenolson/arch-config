filetype on
filetype plugin on
filetype indent on " file type based indentation

set mouse=c
set shiftwidth=2
set tabstop=2
set expandtab
syntax on
set viminfo+=<10000
set incsearch
set hlsearch

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=2 softtabstop=0

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
