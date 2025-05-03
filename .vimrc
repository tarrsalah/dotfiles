set nocp
filetype plugin on
filetype indent on

set mouse=a
set ttymouse=sgr
set title
"" set number
set ruler
set encoding=utf-8
set wrap
set textwidth=80
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set noshiftround
set incsearch
set hlsearch
set nobackup
set noswapfile
set updatetime=100
set path+=**
set wildmenu
set statusline+=%F\ %l\:%c
set laststatus=2
set wildmode=longest:full,full
set wildoptions=pum
set termguicolors
set clipboard=unnamedplus
set backspace=indent,eol,start
" set grepprg=ag
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.jar

highlight clear SignColumn
highlight VertSplit cterm=NONE

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
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

colorscheme desert
syntax off
