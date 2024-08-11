set nocp
filetype plugin on
filetype indent on

set mouse=a
set number
set ruler
set encoding=utf-8
set wrap
set textwidth=80
set tabstop=4
set shiftwidth=4
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
set wildmode=longest:full,full
set wildoptions=pum
set termguicolors
set clipboard=unnamed

highlight clear SignColumn
highlight VertSplit cterm=NONE

call plug#begin()
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp' " async lsp support
Plug 'mattn/vim-lsp-settings' " lsp auto-configs
Plug 'prabirshrestha/asyncomplete.vim' " async completion
Plug 'prabirshrestha/asyncomplete-lsp.vim' " lsp source
call plug#end()


" let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

autocmd QuickFixCmdPost * nested cwindow 20 | redraw!
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

let mapleader=" "
nmap <Leader><space> :noh<CR>
nmap <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

let g:black_virtualenv="/home/tarrsalah/.local/share/pipx/venvs/black"

syntax off
