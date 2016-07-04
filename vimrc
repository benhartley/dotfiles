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
NeoBundle 'chriskempson/base16-vim'
NeoBundleLazy 'dag/vim2hs', {'autoload':{'filetypes':['haskell','hs']}}
NeoBundleLazy 'derekwyatt/vim-scala', {'autoload':{'filetypes':['scala']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundleLazy 'ekalinin/Dockerfile.vim', {'autoload': {'filetypes':['Dockerfile']}}
NeoBundle 'ervandew/supertab'
NeoBundleLazy 'exu/pgsql.vim', {'autoload':{'filetypes':['pgsql']}}
NeoBundleLazy 'fatih/vim-go', {'autoload':{'filetypes':['go']}}
NeoBundleLazy 'gavocanov/vim-js-indent', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'hdima/python-syntax', {'autoload':{'filetypes':['python']}}
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffeescript','coffee']}}
NeoBundle 'LFDM/vim-ghi'
NeoBundleLazy 'ledger/vim-ledger', {'autoload':{'filetypes':['ledger']}}
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mustache/vim-mustache-handlebars', {'autoload':{'filetypes':['html']}}
NeoBundle 'mutewinter/nginx.vim'
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload':{'filetypes':['markdown','md']}}
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'tomasr/molokai'
NeoBundleLazy 'ternjs/tern_for_vim', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'tpope/vim-commentary'
NeoBundleLazy 'tpope/vim-fireplace', {'autoload':{'filetypes':['clojure','clj']}}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundleLazy 'vim-scripts/paredit.vim', {'autoload':{'filetypes':['clojure','clj']}}
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['stylus','styl']}}
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'

" check for uninstalled bundles on startup
NeoBundleCheck

call neobundle#end()

" }}}

" filetype indentation
filetype plugin indent on

" disable folding
set nofoldenable
 
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
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['jshint']
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
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-eighties

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
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!^F

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

" copy to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" tabs

noremap <Leader>a :tabe<CR>:Ag 
noremap <Leader>t :tabe<CR>
noremap <Leader>j :tabprevious<CR>
noremap <Leader>k :tabnext<CR>
noremap <Leader>f :Buffers<CR>
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt

" gits
noremap <Leader>g :Gst<CR>
noremap <Leader>b :Gblame<CR>
noremap <Leader>h :Gbrowse<CR>

" snips
noremap <Leader>u :UltiSnipsAddFiletypes 
noremap <Leader>U :UltiSnipsEdit 

" misc
imap ;; <C-o>A;
noremap <Leader>d :TernDef<CR>
let g:sql_type_default = 'pgsql'
nmap <leader>cl yiwoconsole.log('<c-r>"', <c-r>");<esc>^`
"}}}

" FZF {{{
nnoremap <c-p> :FZF<cr>
let g:fzf_command_prefix = 'Fzf'
" }}}

" Mustache {{{
let g:mustache_abbreviations = 1
" }}}

" Airline {{{
let g:airline_powerline_fonts = 0
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
" let g:airline_left_sep = '⮀'
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

" Sessions {{{
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 1
" }}}


nmap gs <Plug>Sneak_s
nmap gS <Plug>Sneak_S
xmap gs <Plug>Sneak_s
xmap gS <Plug>Sneak_S
omap gs <Plug>Sneak_s
omap gS <Plug>Sneak_S

" vim:foldmethod=marker:foldlevel=0:ft=vim
