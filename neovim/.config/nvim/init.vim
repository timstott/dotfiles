set nocompatible

call plug#begin('~/.config/nvim/plugged')
Plug 'trevordmiller/nova-vim'   " Color scheme

" Syntax
Plug 'elixir-lang/vim-elixir'   " Elixir synatx
Plug 'pangloss/vim-javascript'  " JavaScript syntax
Plug 'mxw/vim-jsx'              " React syntax
Plug 'slim-template/vim-slim'   " Slim syntax
Plug 'hashivim/vim-terraform'   " Terraform syntax

" Utils
Plug 'tpope/vim-fugitive'       " Git wrapper
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'       " Surround pairs
Plug 'scrooloose/nerdtree'      " You know it
Plug 'tomtom/tcomment_vim'      " Comment
Plug 'junegunn/fzf'             " Fuzzy finder
Plug 'junegunn/fzf.vim'
call plug#end()

""" Basics
set number                      " Line numbers are good
set history=1000                " Store lots of :cmdline history
set clipboard+=unnamedplus      " Add system clipboard

let mapleader="\<SPACE>"        " Change leader key to SPACE

""" Appearance
colorscheme nova
set colorcolumn=80              " Display 80th column
highlight ColorColumn ctermbg=darkred guibg=darkred
set nowrap                      " Don't wrap lines
set shiftwidth=2                " Indentation amount for < and > commands
set tabstop=2                   " Render TABs using this many spaces
set expandtab                   " Insert spaces when TAB is pressed
set foldmethod=indent           " syntax base folds
set foldlevelstart=8            " new buffer foldlevel

" Display trailing spaces
set list listchars=tab:>\ ,trail:·,eol:¬,extends:…,precedes:…

""" Status line
set showcmd                     " Show incomplete commands
set showmatch                   " Show matching brackets
set showmode                    " Show current mode
set ruler                       " Show the line and column numbers of the cursor

""" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 0       " thin listing (one file per line)
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

""" Search
set incsearch                   " Find the next match as we type the search
set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...unless we type a capital

" Use ag instead of grep
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m

" Custom search
" Suppress grep output and show results in quickfix window
command! -nargs=+ -complete=file Ag execute 'silent grep! <args>' | copen | redraw!

""" Scroll
set splitbelow                  " Horizontal split below current
set splitright                  " Vertical split to right of current

if !&scrolloff
  set scrolloff=3               " Show next 3 lines while scrolling
endif

if !&sidescrolloff
  set sidescrolloff=5           " Show next 5 columns while side-scrolling
endif

""" Completion
set wildmenu                    " Enable cmd menu
set wildmode=list:longest,full  " Display cmd completion in list


" Enable enable spell check and width line breaks with Markdwon files
autocmd BufRead,BufNewFile *.md setlocal spell textwidth=79

""" Plugins

" Find alternate file with alt
function! Alt(path)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec ":e" . " " . l:alternate
  endif
endfunction

" JSX syntax highlighting with .js files
let g:jsx_ext_required = 0

" Enable fzf history feature
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <leader>pa :call Alt(expand("%"))<cr>
nnoremap <leader>ps :Ag ""<left>

nnoremap <c-p> :FZF<cr>
nnoremap <leader>pf :FZF<cr>
nnoremap <leader>pt :NERDTreeToggle<cr>
nnoremap <leader>pl :NERDTreeFind<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
