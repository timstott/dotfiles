set nocompatible               " be iMproved
filetype off                   " required

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" Bundle 'gmarik/vundle'

" My plugins

" Bundle "git://github.com/mileszs/ack.vim.git"
" Bundle "git://github.com/tpope/vim-sensible.git"
" Bundle "git://github.com/tpope/vim-rvm.git"
" Bundle "git://github.com/chrismetcalf/vim-yankring.git"
" Bundle "git://github.com/chrismetcalf/vim-taglist.git"
" " Helps to end certain structures automatically (e.g. if...end)
" Bundle "git://github.com/scrooloose/syntastic.git"
" Bundle "git://github.com/Townk/vim-autoclose.git"
" Bundle "git://github.com/scrooloose/nerdtree.git"
" Bundle "git://github.com/sophacles/vim-bundle-sparkup.git"
" Bundle "git://github.com/panozzaj/vim-autocorrect.git"
" Bundle "git://github.com/tomtom/tcomment_vim.git
" Bundle "git://github.com/sjl/gundo.vim.git"
" Bundle "git://github.com/clones/vim-fuzzyfinder.git"
" Bundle "git://github.com/godlygeek/tabular.git"
" Bundle "git://github.com/vim-scripts/Gist.vim.git"
" Bundle "git://github.com/vim-scripts/L9.gi" t"
" Bundle "git://github.com/Bogdanp/rbrepl.vim.git"
" Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'git://github.com/altercation/vim-colors-solarized.git' 
" Bundle "git://github.com/kana/vim-textobj-user.git"
" Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
" Bundle "git://github.com/ervandew/supertab.git"
" Bundle "jQuery"
" " Syntax highlighting
" Bundle "git://github.com/pangloss/vim-javascript.git"
" Bundle "git://github.com/tpope/vim-markdown.git"
" Bundle "git://github.com/greyblake/vim-preview.git"
" Dependancies for vim-snipmate 
" Bundle "MarcWeber/vim-addon-mw-utils"
" Bundle "tomtom/tlib_vim"
" Bundle "garbas/vim-snipmate"
" 
" Bundle "honza/vim-snippets"
" Bundle "git://github.com/Lokaltog/vim-powerline.git"
" 
" Sensible settings are set in Tim's Pope sensible.vim

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

filetype plugin indent on     
let mapleader = ","
let g:mapleader = ","
set modelines=0
set nobackup
set nowritebackup
set noswapfile
syntax enable

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title                  " set window title 
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set hidden
set wildmode=list:longest
set visualbell              " use visual bell instead of beeping
set cursorline
set backspace=indent,eol,start
set number
set undofile

" Auto adjust window sizes when they become current
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

colorscheme solarized
set background=dark

" set splitbelow splitright

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
" set textwidth=79
set formatoptions=n

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
" if exists("+colorcolumn")
  " set colorcolumn=80
" endif

"  ---------------------------------------------------------------------------
"  Status Line
"  ---------------------------------------------------------------------------

" path
" set statusline=%f
" flags
" set statusline+=%m%r%h%w
" git branch
" set statusline+=\ %{fugitive#statusline()}
" encoding
" set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
" rvm
" set statusline+=\ %{rvm#statusline()}
" line x of y
" set statusline+=\ [line\ %l\/%L]

" Colour
" hi StatusLine ctermfg=Black ctermbg=White

" Change colour of statusline in insert mode
" au InsertEnter * hi StatusLine ctermbg=DarkBlue
" au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" turn search highlight off
nnoremap <leader><space> :noh<cr> 
" search (forwards)
nmap <space> /
" search (backwards)
map <c-space> ?

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

imap <C-h> <ESC>^
imap <C-l> <ESC>$

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" nnoremap j gj
" nnoremap k gk

" Map ESC
imap jj <ESC>

" ACK
set grepprg=ack

" ,a to Ack (search in files)
nnoremap <leader>a :Ack 

" Ack settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files

" Auto format
map === mmgg=G`m^zz

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up and down
" map <C-J> :m +1 <CR>
" map <C-K> :m -2 <CR>

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old

" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" EXTERNAL COPY / PASTE
" Press F2 before and after pasting from an external Window, not required for
" MacVim
set pastetoggle=<F2>
map <C-v> "+gP<CR>
vmap <C-c> "+y

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" F2 - Terminal
map <F2> :ConqueTerm zsh<CR>

" F3 - YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

let g:yankring_history_dir = '/tmp'

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G`m^zz
imap  <silent> <F6> <Esc> mmgg=G`m^zz

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Command-T
" find file
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" find file in current directory
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

let g:CommandTMaxHeight = 20

" NERDTree
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 30 
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
" open file browser
map <leader>p :NERDTreeToggle<cr>

" TagList
set tags=./tags;
" Support for https://github.com/ivalkeen/guard-ctags-bundler
set tags+=gems.tags
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
" Generate ctags for all bundled gems as well
map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i

" Buffer window (find file in open buffers)
nmap <silent> <leader>b :FufBuffer<CR>

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
let g:AutoCloseProtectedRegions = ["Character"] 

let my_home = expand("$HOME/")

if filereadable(my_home . '.vim/bundle/vim-autocorrect/autocorrect.vim')
  source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
endif

" BLAAAME
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1

" Easy commenting
" nnoremap // :TComment<CR>
" vnoremap // :TComment<CR>

" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Syntastic
" let g:syntastic_auto_loc_list=1
" let g:syntastic_auto_jump=1

"  ---------------------------------------------------------------------------
"  Ruby/Rails
"  ---------------------------------------------------------------------------

" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Skip to Model, View or Controller
map <Leader>m :Rmodel 
map <Leader>v :Rview 
map <Leader>c :Rcontroller 

" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

"  ---------------------------------------------------------------------------
"  CoffeeScript
"  ---------------------------------------------------------------------------

let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

"  ---------------------------------------------------------------------------
"  SASS / SCSS
"  ---------------------------------------------------------------------------

au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA 
  set mouse=v
  set guifont=Monaco:h12 "<- Maybe a good idea when using mac
endif
set guifont=Monaco:h12

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh
