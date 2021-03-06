" check for changes to current file every 4 secs
:au CursorHold * checktime

" Plug
" - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-conflicted'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', {'for':'go'}
Plug 'google/vim-jsonnet', {'for': 'jsonnet'}
Plug 'junegunn/fzf.vim' | Plug '/usr/bin/fzf'
Plug 'justinmk/vim-sneak'
Plug 'keith/gist.vim', {'on':'Gist'}
Plug 'ledger/vim-ledger', {'for':'ledger'}
Plug 'mhinz/vim-grepper'
Plug 'plasticboy/vim-markdown', {'for':['markdown','md']}
Plug 'Raimondi/delimitMate'
Plug 'romainl/vim-qf'
Plug 'SirVer/ultisnips'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tsandall/vim-rego'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vito-c/jq.vim', {'for':'jq'}
Plug 'Yggdroot/indentLine'
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

" wildmenu - tab to get autocomplete menu in Ex mode
set wildmenu

" don't redraw so often, feels quicker
set lazyredraw

" auto-indent
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2 
set cinkeys=0{,0},:,0#,!^F

" open new panes in the right places...
set splitbelow
set splitright

" reselect pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" syntax highlight for spelling mistake
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" default to command-line window (and very magic search)
nnoremap / q/i\v
nnoremap : q:i

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
noremap <Leader>g :G<CR>
noremap <Leader>b :Gblame<CR>
noremap <Leader>h :Gbrowse<CR>
let b:rhubarb_homepage = "http://github.com/eeveebank/platform-engineering"

" UltiSnips
noremap <Leader>u :UltiSnipsAddFiletypes 
noremap <Leader>U :UltiSnipsEdit 
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsEditSplit="vertical"

" Go 
au FileType go noremap <Leader>d :GoDef<CR>
au FileType go noremap <Leader>c :GoDoc<CR>
au FileType go noremap <Leader>r :GoRun<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" FZF 
let g:fzf_command_prefix = 'Fzf'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'FzfFiles' s:find_git_root()

noremap <C-p> :ProjectFiles<CR>
noremap <Leader>fa :FzfAg 
noremap <Leader>fb :FzfBuffers<CR>
noremap <Leader>ff :FzfLocate 
noremap <Leader>fgs :FzfGFiles?<CR>
noremap <Leader>fl :FzfLines<CR>
noremap <Leader>fw :FzfWindows<CR>

imap <c-x><c-f> <plug>(fzf-complete-path)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Airline 
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

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Sneak
nmap <Leader>s <Plug>Sneak_s
nmap <Leader>S <Plug>Sneak_S
xmap <Leader>s <Plug>Sneak_s
xmap <Leader>S <Plug>Sneak_S
omap <Leader>s <Plug>Sneak_s
omap <Leader>S <Plug>Sneak_S

" Ag
let g:ackprg = 'ag --vimgrep'
noremap <Leader>a :GrepperAg 

" Don't leak pass
au BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile

" supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-p>"

" Syntastic
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_dockerfile_checkers = ["hadolint"]
let g:syntastic_yaml_checkers = ["yamllint"]
let g:syntastic_yaml_yamllint_args = ["-d relaxed"]

" vim-go
autocmd BufWritePost *.go call go#cmd#Build(1)
let g:go_fmt_command = "goimports"

" Ledger
au FileType ledger nnoremap <Leader>gt :read !openssl rand -hex 3<CR>

" Terraform
let g:terraform_fmt_on_save = 1

" vim-qf
nmap <Leader>l <Plug>(qf_qf_switch)

" Conceal nonsense
set conceallevel=2
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
au FileType * setl cole=0

" vim:foldmethod=marker:foldlevel=0:ft=vim
