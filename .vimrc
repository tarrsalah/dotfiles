set nocp
filetype plugin on
filetype indent on

set autoindent
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set grepprg=grep\ -rnI\ --exclude-dir=node_modules
set hidden
set hlsearch
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noshiftround
set noswapfile
set path+=**
set ruler
set shiftwidth=2
set smartindent
set statusline+=%F\ %l\:%c
set tabstop=2
set termguicolors
set textwidth=80
set title
set ttymouse=sgr
set updatetime=100
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.jar
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set wrap
" highlight FoldColumn guibg=#ffffdd


highlight clear SignColumn
highlight VertSplit cterm=NONE

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-dispatch'
call plug#end()

let g:netrw_banner = 0

autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd BufWritePre *.tf,*.tfvars TerraformFmt
autocmd VimEnter * if argc() == 0 | Explore | endif
autocmd QuickFixCmdPost *grep* cwindow

let mapleader=" "
vmap 4 $
nmap <Leader><space> :noh<CR>
nmap <C-b> :CtrlPBuffer<CR>

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>
nnoremap <C-s> :w<cr>

"" java
autocmd FileType java nnoremap <buffer> <Leader>j :!mvn compile<CR>

colorscheme industry
syntax off
