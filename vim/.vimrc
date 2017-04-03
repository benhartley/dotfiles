" check for changes to current file every 4 secs
:au CursorHold * checktime

" Plug
" - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim', {'for':'Dockerfile'}
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', {'for':'go'}
Plug 'flowtype/vim-flow', {'for':'javascript'}
Plug 'hashivim/vim-terraform', {'for':['tf', 'tfvars', 'tfstate']}
Plug 'junegunn/fzf.vim' | Plug '/usr/bin/fzf'
Plug 'justinmk/vim-sneak'
Plug 'keith/gist.vim', {'on':'Gist'}
Plug 'jaawerth/nrun.vim', {'for':['javascript','javascript.jsx','typescript','typescript.tsx']}
Plug 'leafgarland/typescript-vim', {'for':['typescript','typescript.tsx']}
Plug 'ledger/vim-ledger', {'for':'ledger'}
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper', {'on':'Grepper'}
Plug 'mutewinter/nginx.vim', {'for':'nginx'}
Plug 'mxw/vim-jsx', {'for':['javascript','javascript.jsx','typescript','typescript.tsx']}
Plug 'neomake/neomake'
Plug 'othree/yajs.vim', {'for':'javascript'}
Plug 'plasticboy/vim-markdown', {'for':['markdown','md']}
Plug 'Quramy/tsuquyomi', {'for':['typescript','typescript.tsx']}
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Shougo/vimproc.vim', {'for':'typescript'}
Plug 'ternjs/tern_for_vim', {'for':'javascript', 'do':'npm i'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()

" filetype indentation
filetype plugin indent on

" disable folding
set nofoldenable
 
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
au InsertEnter * hi StatusLine term=reverse ctermbg=15 gui=undercurl guisp=White
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" specific setting on a per file basis
set modelines=1

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

" colors 
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-eighties

" syntax stuff
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.ledger set ft=ledger

" FileType autocmds 
autocmd FileType mail set spell
autocmd FileType gitcommit set spell
autocmd FileType markdown set spell

" supertab
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

" open new panes in the right places...
set splitbelow
set splitright

" reselect pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" syntax highlight for spelling mistake
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" make searchs very magic by default
nnoremap / /\v

" access directory with -
nnoremap - :Ex<return>

" set space to leader
let mapleader = ' '

" save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" tabs
noremap <Leader>t :tabe<CR>
noremap <Leader>j :tabprevious<CR>
noremap <Leader>k :tabnext<CR>

" gits
noremap <Leader>g :Gst<CR>
noremap <Leader>b :Gblame<CR>
noremap <Leader>h :Gbrowse<CR>

" UltiSnips
noremap <Leader>u :UltiSnipsAddFiletypes 
noremap <Leader>U :UltiSnipsEdit 
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsEditSplit="vertical"

" JavaScript 
au FileType javascript imap ;; <C-o>A;
au FileType javascript noremap <Leader>d :TernDef<CR>
au FileType javascript nmap <leader>cl yiwoconsole.log('<c-r>"', <c-r>");<esc>^`

" Go 
au FileType go noremap <Leader>d :GoDef<CR>
au FileType go noremap <Leader>r :GoRun<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" FZF 
let g:fzf_command_prefix = 'Fzf'

noremap <C-p> :FZF -e<CR>
noremap <Leader>fw :FzfWindows<CR>
noremap <Leader>fb :FzfBuffers<CR>
noremap <Leader>fl :FzfLines<CR>
noremap <Leader>fgs :FzfGFiles?<CR>
noremap <Leader>ff :FzfLocate 

imap <c-x><c-f> <plug>(fzf-complete-path)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Airline 
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

" Sneak
nmap <Leader>s <Plug>Sneak_s
nmap <Leader>S <Plug>Sneak_S
xmap <Leader>s <Plug>Sneak_s
xmap <Leader>S <Plug>Sneak_S
omap <Leader>s <Plug>Sneak_s
omap <Leader>S <Plug>Sneak_S

" Ag
let g:ackprg = 'ag --vimgrep'
noremap <Leader>a :Grepper -query 

" Flow
let g:flow#autoclose = 1

" Don't leak pass
au BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile

" Vim Wiki
nmap <Leader>wc <Plug>VimwikiToggleListItem
augroup vimwiki
    au! BufRead /home/btfh/vimwiki/* :exe 'silent! !git pull' | redraw!
    au! BufWritePost /home/btfh/vimwiki/* :exe 'silent! !git add --all;git commit -m "Auto commit";git push' | redraw!
augroup END

" Neomake
autocmd! BufEnter,BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
augroup always-open-signcolumn
  autocmd!
  autocmd BufEnter * sign define dummy
  autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END
nmap <Leader>l ]l
nmap <Leader>L [l

" vim:foldmethod=marker:foldlevel=0:ft=vim
