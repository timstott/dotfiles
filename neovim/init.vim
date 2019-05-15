""" Basics
set history=1000                " Store lots of :cmdline history
set clipboard+=unnamedplus      " Add system clipboard
set nobackup
set nowritebackup
set noswapfile 
set undofile                    " Preserve undo history between sessions

let mapleader="\<SPACE>"        " Change leader key to SPACE

""" Appearance
set background=dark
colorscheme solarized
set number                      " Line numbers are good
set colorcolumn=81              " Display 81th column
set nowrap                      " Don't wrap lines
set shiftwidth=2                " Indentation amount for < and > commands
set tabstop=2                   " Render TABs using 2 spaces
set expandtab                   " Insert spaces when TAB is pressed
set foldmethod=indent           " syntax base folds
set foldlevelstart=8            " new buffer foldlevel

" Display trailing spaces
set listchars=tab:>\ ,trail:·,eol:¬
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

""" Cmd completion
set wildmenu                    " Enable cmd menu
set wildmode=list:longest,full  " Display cmd completion in list

""" Plugins
let test#strategy = "neovim"

" Enable fzf history feature
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \   }
      \ }

" Find alternate file with alt
function! Alt(path)
  echo "FIXME with projectionist!"
endfunction

augroup filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{tslint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile *.go set noexpandtab|set listchars=tab:\ \ ,trail:·,eol:¬|set list
augroup END

""" Mappings
nnoremap <leader>pa :call Alt(expand("%"))<cr>
nnoremap <leader>ps :Ag ""<left>
nnoremap <leader>pS :Ag "\b<c-r><c-w>\b"<cr>:cw<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>bd :bd<cr>

nnoremap <c-p> :FZF<cr>
nnoremap <leader>pf :FZF<cr>
nnoremap <leader>pt :NERDTreeToggle<cr>
nnoremap <leader>pl :NERDTreeFind<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <silent>vv <c-w>v
nnoremap <silent>ss <c-w>s

xmap ga <Plug>(EasyAlign)

" Quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <silent> // :nohlsearch<CR>

nnoremap <leader>tt :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>

" Hide statusline when fzf starts in a terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
