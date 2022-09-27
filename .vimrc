""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @file:    .vimrc
" @author:  shawshary
" @email:   xinyuloveswork@163.com
" @date:    2022-09-27
" @brief:   vim configuration file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options Setting:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set vb t_vb=
set belloff=all
syntax on
set number
set relativenumber
set showcmd
set wrap
set backspace=indent,eol,start
set hlsearch
filetype plugin indent on
set nocompatible
set encoding=utf-8
set directory=$HOME/.vim/swapfiles/
" Dispaly all matching files when we tab complete
set wildmenu
" fold setting
set foldmethod=manual
set foldlevel=99
set laststatus=2
set autochdir

"auto indent and set indent length = 4
set textwidth=80
filetype indent on
set autoindent
set expandtab  "replace tab with spaces
set shiftwidth=4  ">> in normal
set tabstop=4  "tab in insert
set softtabstop=4  "backspace can delete the expandtab spaces

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variables Definition:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
let maplocalleader=" "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype cpp setlocal cindent expandtab cino=g0 shiftwidth=2 tabstop=2 sts=2
autocmd Filetype c setlocal cindent expandtab cino=g0 shiftwidth=2 tabstop=2 sts=2
autocmd Filetype sh setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd Filetype tex setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd Filetype matlab setlocal fo+=cj expandtab
"------------------------------------------------------------"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <LEADER><CR> :nohlsearch<CR>
" screen split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
" toggle between multiple screens
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j

map s <nop>
map S :w<CR>

" tag edit  add new tag windows
nnoremap te :tabe<CR>
nnoremap th <C-PageUp><CR>
nnoremap tl <C-PageDown><CR>

" N key: go to the start of the line
noremap 0 ^
" I key: go to the end of the line
noremap <C-l> $

" Convert word to Uppercase
inoremap <C-u> <esc>gUiwea
inoremap <C-j> <esc>guiwgUlea



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Installation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" colorscheme
packadd! iceberg.vim

" file navigation
packadd! nerdtree

" snippets
packadd! ultisnips
packadd! vim-snippets

" status line
packadd! vim-airline

" smart table
packadd! vim-table-mode

" conquer of completion
packadd! coc.nvim



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Colorscheme: 
syntax enable
set background=dark
colorscheme iceberg


" Vim Table Mode:
"
" For Markdown-compatible tables use
let g:table_mode_corner='|'
nnoremap <LEADER>tm :TableModeToggle<CR>
nnoremap <LEADER>tdc g:table_mode_delete_column_map<CR>


" NERDTree: 
nnoremap ntt :NERDTreeToggle<CR>


" UltiSnips: 
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = 'context'


" CoC Settings:
let g:coc_global_extensions = [
    \   'coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-sh', 'coc-snippets']

