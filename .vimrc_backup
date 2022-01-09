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
set path+=**
set wildmenu
let g:netrw_banner=0
let g:fzf_preview_window = []
highlight clear SignColumn

call plug#begin('~/.vim/plugged')
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/vim-gitgrep'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType elixir setlocal ts=2 sts=2 sw=2

let mapleader=" "
nmap <Leader><space> :noh<CR>
nmap <C-p> :GitFiles<CR>
nmap <C-b> :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
noremap <Leader>s	:update<CR>
nnoremap ; :

augroup DiffHighlight
	autocmd!
	autocmd FileType diff syntax on
augroup END
syntax off

filetype plugin indent on
