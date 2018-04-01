set nocompatible

call plug#begin('~/.config/nvim/plugged')
Plug 'trevordmiller/nova-vim'   " Color scheme

" Syntax
Plug 'elixir-lang/vim-elixir'   " Elixir synatx
Plug 'pangloss/vim-javascript'  " JavaScript syntax
Plug 'mxw/vim-jsx'              " React syntax
Plug 'slim-template/vim-slim'   " Slim syntax
Plug 'hashivim/vim-terraform'   " Terraform syntax
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

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
set colorcolumn=81              " Display 81th column
set nowrap                      " Don't wrap lines
set shiftwidth=2                " Indentation amount for < and > commands
set tabstop=2                   " Render TABs using 2 spaces
set expandtab                   " Insert spaces when TAB is pressed
set foldmethod=indent           " syntax base folds
set foldlevelstart=8            " new buffer foldlevel

highlight ColorColumn ctermbg=darkred guibg=darkred
highlight IncSearch guibg=green ctermbg=green term=underline

" Display trailing spaces
set listchars=tab:\ \ ,trail:·,eol:¬,extends:…,precedes:…
set list

""" Status line
set showcmd                     " Show incomplete commands
set showmatch                   " Show matching brackets
set showmode                    " Show current mode
set ruler                       " Show the line and column numbers of the cursor

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

""" Markdown
" Enable enable spell check and width line breaks with Markdwon files
autocmd BufRead,BufNewFile *.md setlocal spell textwidth=79

""" Crontab
" Disable backups with contab
autocmd FileType crontab setlocal nobackup nowritebackup

""" Go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab

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

""" Remappings
nnoremap <leader>pa :call Alt(expand("%"))<cr>
nnoremap <leader>ps :Ag ""<left>
nnoremap <leader>pS :Ag "\b<c-r><c-w>\b"<cr>:cw<cr>

nnoremap <leader>w :w<cr>

nnoremap <c-p> :FZF<cr>
nnoremap <leader>pf :FZF<cr>
nnoremap <leader>pt :NERDTreeToggle<cr>
nnoremap <leader>pl :NERDTreeFind<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <silent>vv <c-w>v
nnoremap <silent>ss <c-w>s

" Quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
