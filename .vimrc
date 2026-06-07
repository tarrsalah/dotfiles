set nocp
filetype plugin on
filetype indent on

set autoindent
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set hidden
set history=1000
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
" set termguicolors
set textwidth=80
set title
set ttymouse=sgr
set updatetime=100
set wildignore+=*.so,*.swp,*.zip,*.class,*.jar,*/.git/*,*/node_modules/*
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
:set nowrap
set viminfo='500,<100,s50


highlight clear SignColumn
highlight VertSplit cterm=NONE

highlight Visual term=NONE cterm=NONE ctermbg=240 guibg=#444444
highlight Search term=NONE cterm=NONE ctermfg=0 ctermbg=220 guifg=#000000 guibg=#ffd75f
highlight IncSearch term=NONE cterm=NONE ctermfg=0 ctermbg=45 guifg=#000000 guibg=#00d7ff
highlight CurSearch term=NONE cterm=NONE ctermfg=0 ctermbg=45 guifg=#000000 guibg=#00d7ff

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

let g:netrw_banner = 0
let g:netrw_sort_by = 'name'
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_sort_direction = 'normal'

autocmd BufWritePre *.tf,*.tfvars TerraformFmt
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd QuickFixCmdPost *grep* cwindow
autocmd VimEnter * if argc() == 0 | Explore | endif

let mapleader=" "
vmap 4 $

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>p :CtrlP<CR>

nnoremap ; :
nnoremap q; q:

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>

syntax off
