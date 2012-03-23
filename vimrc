" check for changes to current file every 4 secs
:au CursorHold * checktime
 
" persistent undo
set undofile
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" status line
set statusline+=%{SyntasticStatuslineFlag()} " syntastic errors

" no code folding
set nofoldenable

" wildmenu tab completion for filenames
set wildmode=longest,list,full
set wildmenu

" syntastic
" this doesn't work...
let g:syntastic_enable_signs = 0
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

" generic
set encoding=utf-8
set showcmd
set cursorline
set backspace=indent,eol,start
set laststatus=2
set scrolloff=999
set nocompatible

" smart case search
set ignorecase
set smartcase

" line-numbering
set number
set ruler

" syntax stuff
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead jquery.*.js set ft=javascript syntax=jquery

" pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" filetype indentation !! coffeescript plugin requires this!
filetype plugin indent on

" colors 
syntax enable
colorscheme molokai

" close tags
" autocmd FileType html,php let b:closetag_html_style=1
" autocmd FileType html,xhtml,xml,php source ~/.vim/bundle/closetag/plugin/closetag.vim

" supertab
let g:SuperTabDefaultCompletionType = "context"

" auto-indent
" set cindent
" set smartindent
set autoindent
" set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!^F
