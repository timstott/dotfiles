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

""" Spell
set spelllang=en
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add

""" Scroll
set splitbelow                  " Horizontal split below current
set splitright                  " Vertical split to right of current

""" Cmd completion
set wildmenu                    " Enable cmd menu
set wildmode=list:longest,full  " Display cmd completion in list

""" Plugins
augroup filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{tslint,eslint}rc set filetype=json
augroup END

let NERDTreeMinimalUI=1

let test#strategy = 'dispatch'
let test#ruby#bundle_exec = 0
let test#ruby#use_binstubs = 0

" Enable fzf history feature
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'

" Hide statusline when fzf starts in a terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \   }
      \ }

let g:projectionist_heuristics = {
      \ 'bin/rails': {
      \     'app/*.rb': {
      \       'type': 'source',
      \       'alternate': 'spec/{}_spec.rb'
      \     },
      \     'spec/*_spec.rb': {
      \       'type': 'test',
      \       'alternate': 'app/{}.rb'
      \     }
      \   },
      \ }

""" Mappings

" Project
nnoremap <leader>pt :NERDTreeToggle<cr>
nnoremap <leader>pl :NERDTreeFind<cr>
nnoremap <leader>pf :echo "moved to \<leader\>ff"<cr>
nnoremap <leader>pa :echo "moved to \<leader\>fa"<cr>

" File
nnoremap <c-p> :FZF<cr>
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fa :A<cr>
nnoremap <silent>fp :let @" = expand("%")<cr>

" Buffers
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <silent>vv <c-w>v
nnoremap <silent>ss <c-w>s

" Search
nnoremap <leader>ps :Ag<cr>
nnoremap <leader>pS :Ag \b<c-r><c-w>\b<cr>
vnoremap pS y:Ag <c-r>"<cr>
nnoremap <silent> // :nohlsearch<cr>

" Formatting
xmap ga <Plug>(EasyAlign)

" Movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader>tt :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>

let s:file_backup_dir='~/.local/share/nvim/file-history'
function! BackupCurrentFile()
  if !isdirectory(expand(s:file_backup_dir))
    let cmd = 'mkdir -p ' . s:file_backup_dir . ';'
    let cmd .= 'cd ' . s:file_backup_dir . ';'
    let cmd .= 'git init;'
    call system(cmd)
  endif
  let file = expand('%:p')
  if file =~ fnamemodify(s:file_backup_dir, ':t') | return | endif
  let file_dir = s:file_backup_dir . expand('%:p:h')
  let backup_file = s:file_backup_dir . file
  let cmd = ''
  if !isdirectory(expand(file_dir))
    let cmd .= 'mkdir -p ' . file_dir . ';'
  endif
  let cmd .= 'cp ' . file . ' ' . backup_file . ';'
  let cmd .= 'cd ' . s:file_backup_dir . ';'
  let cmd .= 'git add ' . backup_file . ';'
  let cmd .= 'git commit -m "[backup] ' . file .'";'
  call jobstart(cmd)
endfunction

augroup file_backup
  autocmd!
  autocmd BufWritePost * call BackupCurrentFile()
augroup end
