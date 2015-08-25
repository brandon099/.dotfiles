" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle

runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" ================ General Config ====================

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
syntax on                       "Turn on syntax highlighting
if version >= 703               "Highlight 119th column
    set colorcolumn=119
else
    2mat ErrorMsg '\%119v.'
endif

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
set smartindent
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

" =============== Python-mode ===============
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Disable rope in favor of jedi-vim
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = "K"

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501"

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Set Python file colorcolumn
autocmd FileType python set colorcolumn=120

" =============== Airline (Powerline) ===============

let g:airline_symbols =                     {}
let g:airline_enable_branch                 = 1
let g:airline_enable_virtualenv             = 1
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#branch#enabled     = 1

" vim-powerline symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_readonly_symbol   = ''
let g:syntastic_python_checkers = ['pylint']
set laststatus=2

au BufNewFile,BufRead *.less set filetype=less
