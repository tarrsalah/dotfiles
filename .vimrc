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

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let mapleader="'"
nmap <Leader><space> :noh<CR>
nmap <Leader>g :GitFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>s :Ag<CR>

syntax off
