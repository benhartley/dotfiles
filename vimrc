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
set statusline=%t\ %M\ %=\ line:\ %l/%L
set statusline+=%{SyntasticStatuslineFlag()} " syntastic errors
au InsertEnter * hi StatusLine term=reverse ctermbg=15 gui=undercurl guisp=White
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" no code folding
set nofoldenable

" syntastic
let g:syntastic_enable_signs = 0
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
let g:syntastic_check_on_open=1

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
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.ledger set ft=ledger

" pathogen
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" filetype indentation !! coffeescript plugin requires this!
filetype plugin indent on

" colors 
syntax enable
colorscheme molokai

" FileType autocmds
" autocmd FileType html,php let b:closetag_html_style=1
" autocmd FileType html,xhtml,xml,php source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType mail set spell

" supertab
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-p>"

" wildmenu - tab to get autocomplete menu in Ex mode
set wildmenu

" don't redraw so often, feels quicker
set lazyredraw

" auto-indent
" set cindent
" set smartindent
set autoindent
" set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!^F

" key mapping for build and deploy
map §§ <ESC>:w<CR>:!cake build; cake deploy<CR>

" disable arrows for navigation
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" key mapping for google search
function! Google()
	call inputsave()
	let searchterm = input('Google: ')
	call inputrestore()
	return searchterm
endfunction
map ©© <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Google()<CR>'<CR><CR>

" key mapping for switching panes
noremap ˙ :wincmd h<CR>
noremap ∆ :wincmd j<CR>
noremap ˚ :wincmd k<CR>
noremap ¬ :wincmd l<CR>

" key mapping for switching tabs
noremap  :tabnext<CR>
noremap Ô :tabprevious<CR>

" open new panes in the right places...
set splitbelow
set splitright

" set dir for vim-notes
let g:notes_directory = '~/.notes'

" key binding for removing search highlight
nnoremap <esc> :noh<return><esc>

" reselect pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" syntax highlight for spelling mistake
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" coffeetags
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" make searchs very magic by default
nnoremap / /\v

" set comma to leader
let mapleader = ' '

" leader shortcuts

" save
nnoremap <Leader>w :w<CR>

" copy to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" tabs
noremap <Leader>j :tabprevious<CR>
noremap <Leader>k :tabnext<CR>
noremap <Leader>f :tabf 
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt

" splits
noremap <Leader>v :vs 
noremap <Leader>s :sp 
