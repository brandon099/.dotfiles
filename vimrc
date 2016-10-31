" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ==================

execute pathogen#infect()
execute pathogen#helptags()

" =================== General Config =======================

set shell=/bin/bash                 "Set bash as shell
set number                          "Line numbers are good
set backspace=indent,eol,start      "Allow backspace in insert mode
set history=1000                    "Store lots of :cmdline history
set showcmd                         "Show incomplete cmds down the bottom
set noshowmode                      "Do not show current mode down the bottom
set visualbell                      "No sounds
set autoread                        "Reload files changed outside vim
set cursorline                      "Highlight Current selected line
set shortmess=atI                   "Shorten command-line text and other info tokens
set noru                            "Turn off ruler
set hidden                          "Allow buffers to exist in the background
set timeoutlen=1000                 "Set mapping timeout length to 1000ms
set ttimeoutlen=10                  "Set Key code delay to 10ms
set mouse-=a                        "Turn off mouse mode
syntax on                           "Turn on syntax highlighting

" Remapped Keys
:nnoremap <space> za
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" =================== Theme Settings ====================

syntax enable
set background=dark
let base16colorspace=256
set t_Co=16
colorscheme base16-ocean

" Italics for comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" =================== Search Settings ====================

set incsearch                       "Find the next match as we type the search
set hlsearch                        "Highlight searches by default
set viminfo='100,f1                 "Save up to 100 marks, enable capital marks

" =================== Turn Off Swap Files =================

set noswapfile
set nobackup
set nowb

" =================== Persistent Undo =====================

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" =================== Indentation =========================

set autoindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:»·,trail:· "Display tabs and trailing spaces visually
set nowrap                          "Don't wrap lines
set linebreak                       "Wrap lines at convenient points

" =================== Folds ===============================

set foldmethod=indent               "fold based on indent
set foldnestmax=3                   "deepest fold is 3 levels
set nofoldenable                    "dont fold by default

" =================== Completion ==========================

set wildmode=list:longest
set wildmenu                        "Enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~         "Ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" =================== Scrolling ===========================

set scrolloff=3                     "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

if &term =~ '^tmux'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" =================== Python ==============================

let python_space_errors = 1
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import = 0
autocmd FileType python set colorcolumn=120

au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab autoindent fileformat=unix

" =================== Airline =============================

let g:airline_symbols                       = {}
let g:airline_theme                         = "base16"
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline_left_sep                      = ''
let g:airline_left_sep                      = ''
let g:airline_right_sep                     = ''
let g:airline_right_sep                     = ''
let g:bufferline_echo                       = 0
set laststatus=2

" =================== Ctrl-P ==============================

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Requires Silver Searcher to be installed

" =================== File Specific settings ==============
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.jsdb set filetype=json
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 softtabstop=2 shiftwidth=2
