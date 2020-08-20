set nocompatible
filetype plugin indent on
set number
set ruler
set encoding=utf-8
set wrap
set textwidth=79
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set incsearch
set hlsearch
set nobackup
set noswapfile

hi Search cterm=NONE ctermfg=grey ctermbg=blue

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
call plug#end()

let mapleader="'"
nmap <Leader><space> :noh<CR>
nmap <Leader>g :GitFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>s :Ag<CR>

syntax off
