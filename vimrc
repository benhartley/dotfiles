" check for changes to current file every 4 secs
:au CursorHold * checktime

" NeoBundle {{{
" https://github.com/Shougo/neobundle.vim

" required steps
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle manages itself
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc allows plugins to be installed asynchronously
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" add bundles here
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundleLazy 'dag/vim2hs', {'autoload':{'filetypes':['haskell','hs']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'ervandew/supertab'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffeescript','coffee']}}
NeoBundle 'kien/ctrlp.vim'
NeoBundleLazy 'ledger/vim-ledger', {'autoload':{'filetypes':['ledger']}}
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'marijnh/tern_for_vim', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'mileszs/ack.vim'
NeoBundleLazy 'mustache/vim-mustache-handlebars', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript']}}
" NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload':{'filetypes':['markdown','md']}}
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-commentary'
NeoBundleLazy 'tpope/vim-fireplace', {'autoload':{'filetypes':['clojure','clj']}}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundleLazy 'tpope/vim-leiningen', {'autoload':{'filetypes':['clojure','clj']}}
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['stylus','styl']}}

" check for uninstalled bundles on startup
NeoBundleCheck

call neobundle#end()

" }}}

" filetype indentation
filetype plugin indent on
 
" Temporary files {{{

" persistent undo
set undofile
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup
" }}}

" status line
set statusline=%t\ %M\ %=\ line:\ %l/%L
set statusline+=%{SyntasticStatuslineFlag()} " syntastic errors
au InsertEnter * hi StatusLine term=reverse ctermbg=15 gui=undercurl guisp=White
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" specific setting on a per file basis
set modelines=1

" Syntastic {{{
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_signs = 0
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_ignore_files = ['*.html']
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
let g:syntastic_check_on_open=1
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }
" }}}

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

" Syntax highlight {{{

" colors 
syntax on
colorscheme molokai

" syntax stuff
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead jquery.*.js set ft=javascript syntax=jquery
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.ledger set ft=ledger
au BufNewFile,BufRead *.coffee set ft=coffee
au BufNewFile,BufRead *.hbs set ft=mustache

" }}}

" FileType autocmds {{{
autocmd FileType mail set spell
autocmd FileType gitcommit set spell
autocmd FileType markdown set spell
" }}}

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

" jj = Esc
imap jj <Esc>

" Disable keys {{{

" disable arrows for navigation
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" }}}

" Panes {{{

" key mapping for switching panes
noremap ˙ :wincmd h<CR>
noremap ∆ :wincmd j<CR>
noremap ˚ :wincmd k<CR>
noremap ¬ :wincmd l<CR>

" open new panes in the right places...
set splitbelow
set splitright

" }}}

" Tabs {{{

" key mapping for switching tabs
noremap  :tabnext<CR>
noremap Ô :tabprevious<CR>

" }}}

" key binding for removing search highlight
nnoremap <esc> :noh<return><esc>

" reselect pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" syntax highlight for spelling mistake
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" make searchs very magic by default
nnoremap / /\v

" access directory with -
nnoremap - :Ex<return>

" Leader shortcuts {{{

" set space to leader
let mapleader = ' '

" save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

nnoremap <Leader>d odebugger;<ESC>:w<CR>

" copy to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" tabs
noremap <Leader>a :tabe<CR>:Ack 
noremap <Leader>t :tabe<CR>
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

" gits
noremap <Leader>g :Gst<CR>

" snips
noremap <Leader>u :UltiSnipsAddFiletypes 
noremap <Leader>U :UltiSnipsEdit 

"}}}


" CtrlP {{{
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }}}

" Mustache {{{
let g:mustache_abbreviations = 1
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1 
let g:airline#extensions#default#layout = [
	\ ['a', 'b', 'c'],
	\ ['warning']
\ ]

function! AirlineInit()
	let g:airline_section_b = airline#section#create(['branch'])
	let g:airline_section_x = ''
	let g:airline_section_y = ''
	let g:airline_section_z = ''
endfunction
autocmd VimEnter * call AirlineInit()

let g:airline_left_sep = '»'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" vim:foldmethod=marker:foldlevel=0:ft=vim
