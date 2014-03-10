" Leader
let mapleader = " "

set backspace=2
set nocompatible  " Use Vim settings, rather then Vi settings
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands
set incsearch     " Do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" Soft tab, 2 space
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Color scheme
set background=dark
colorscheme solarized
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Number
set number
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

" My mappings
inoremap jj <ESC>

set hlsearch            " highlight all matches

" set scrolloff=3
set fileencoding=utf-8  " file encoding
set encoding=utf-8      " encoding inside vim
" "set autoindent
" set smartindent
" set showmode
" set hidden
" set wildmode=list:longest   " use emacs-style tab completion when selecting files, etc
" set visualbell              " use visual bell instead of beeping
" set cursorline
" set undofile
" 
" set nowrap
" " set textwidth=79
" set formatoptions=n


" Searching / moving
" vnoremap / /\v
" set showmatch
" set incsearch
set ignorecase
set smartcase
