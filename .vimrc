set wildmenu
set statusline+=%F\ %l\:%c
set wildmode=longest:full,full
set hlsearch
set nocompatible
set number
set mouse=a
set title
set laststatus=2"
set clipboard=unnamedplus
hi Search ctermbg=LightYellow
hi Search ctermfg=Black
highlight VertSplit cterm=NONE
set signcolumn=yes
set nocp
filetype plugin on
highlight clear SignColumn

call plug#begin()
Plug 'jceb/vim-orgmode'
Plug 'ctrlpvim/ctrlp.vim'
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

autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
nnoremap <space><space> :noh<CR>

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|__pycache__)|(\.(swp|ico|git|svn))$'
let g:black_virtualenv="/home/tarrsalah/.local/share/pipx/venvs/black"

autocmd QuickFixCmdPost * nested cwindow 20 | redraw!

set wildmenu
set wildoptions=pum
syntax off
