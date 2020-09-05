set nocompatible
filetype plugin on
filetype indent on

set mouse=a
set number
set ruler
set encoding=utf-8
set wrap

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

set textwidth=80
set noshiftround
set incsearch
set hlsearch
set nobackup
set noswapfile
set updatetime=100

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

autocmd FileType javascript setlocal ts=2 sts=2 sw=2

let mapleader="'"
nmap <Leader><space> :noh<CR>
nmap <Leader>g :GitFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>s :Ag<CR>

syntax off
