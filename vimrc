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

" =================== Code ================================

let python_space_errors = 1
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import = 0
let g:syntastic_check_on_open = 1
autocmd FileType python set colorcolumn=120

au BufNewFile,BufRead *.py
    \ set shiftwidth=4 textwidth=119 fileformat=unix

" =================== Lightline ===========================

let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \     'left': [
    \         ['mode', 'paste'],
    \         ['gitbranch', 'readonly'],
    \         ['bufferline']
    \     ],
    \     'right': [
    \         ['filetype']
    \     ]
    \ },
    \ 'component': {
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'gitbranch': '%{exists("*gitbranch#name")?gitbranch#name():""}'
    \ },
    \ 'component_function': {
    \     'bufferline'   : 'MyBufferline',
    \ },
    \ 'component_visible_condition': {
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'gitbranch': '(exists("*gitbranch#name") && ""!=gitbranch#name())'
    \ },
    \ }
let g:lightline.mode_map = {
    \ 'n'      : 'N',
    \ 'i'      : 'I',
    \ 'R'      : 'R',
    \ 'v'      : 'V',
    \ 'V'      : 'V-L',
    \ 'c'      : 'C',
    \ "\<C-v>" : 'V-B',
    \ 's'      : 'S',
    \ 'S'      : 'S-L',
    \ "\<C-s>" : 'S-B',
    \ '?' : '      ' }

function! MyBufferline()
    call bufferline#refresh_status()
    let b = g:bufferline_status_info.before
    let c = g:bufferline_status_info.current
    let a = g:bufferline_status_info.after
    let alen = strlen(a)
    let blen = strlen(b)
    let clen = strlen(c)
    let w = winwidth(0) * 4 / 11
    if w < alen+blen+clen
        let whalf = (w - strlen(c)) / 2
        let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
        let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
        return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
    else
        return b . c . a
    endif
endfunction

let g:bufferline_echo = 0

set laststatus=2

" =================== Ctrl-P ==============================

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Requires Silver Searcher to be installed
