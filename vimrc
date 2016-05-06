" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle

execute pathogen#infect()
execute pathogen#helptags()

" ================ General Config ====================

set shell=/bin/bash             "Set bash as shell
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set noshowmode                  "Do not show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "Highlight Current selected line
set shortmess=atI               "Shorten command-line text and other info tokens
set noru                        "Turn off ruler
set hidden                      "Allow buffers to exist in the background
set timeoutlen=1000             " Set mapping timeout length to 1000ms
set ttimeoutlen=10              " Set Key code delay to 10ms
set mouse-=a                    "Turn off mouse mode
syntax on                       "Turn on syntax highlighting
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" ================ Color Theme Settings ==============

syntax enable
set background=dark
let base16colorspace=256
set t_Co=16
colorscheme base16-ocean

" ================ Search Settings =================

set incsearch       "Find the next match as we type the search
set hlsearch        "Hilight searches by default
set viminfo='100,f1 "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on


set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces visually
set nowrap                          "Don't wrap lines
set linebreak                       "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent               "fold based on indent
set foldnestmax=3                   "deepest fold is 3 levels
set nofoldenable                    "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                        "Enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~         "Ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=3                     "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" ================ Pymode ===========================

let g:pymode_lint_on_fly = 1
let g:pymode_lint_ignore="E501,W601"
let g:pymode_rope = 0
let g:pymode_indent = 1

" Set Python file colorcolumn
autocmd FileType python set colorcolumn=80

" ================ Airline (Powerline) ==============

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

au BufNewFile,BufRead *.less set filetype=less
