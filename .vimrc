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

call plug#begin('~/.vim/plugged')
Plug 'elixir-editors/vim-elixir'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/vim-gitgrep'
call plug#end()

autocmd FileType javascript setlocal ts=2 sts=2 sw=2

let mapleader=" "
nmap <Leader><space> :noh<CR>
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <C-p> :GitFiles<CR>
nmap <C-b> :Buffers<CR>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

syntax off
filetype plugin indent on
