""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File:    .vimrc
" Author:  shawshary
" Email:   xinyuloveswork@163.com
" Date:    2022-09-27
" Brief:   vim configuration file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options Setting:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The bell will not be rung for all events.
set belloff=all

" Print the line number in front of each line.
set number
" Change the displayed number to be relative to the cursor.
set relativenumber

" always show current position
set ruler

" Show (partial) command in the last line of the screen.
set showcmd

" Change how text is displayed, doesn't change the text in the buffer. Lines
" longer than the width of the window will (no)wrap.
set nowrap
" The minimal number of screen columns to scroll horizontally.
set sidescroll=5
" It is a comma-separated list of string setttings.
" precedes: Character to show in the first visible column of the physical line.
" extends: Character to show in the last column, when wrap is off and the line
"          continues beyond the right of the screen.
set listchars+=precedes:<,extends:>

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
" Comma-separated, each item allows a way to backspace over something.
set backspace=indent,eol,start

" Highlight all previous matched search pattern.
set hlsearch

" Enable filetype detection. Each time a new file is edited, VIM will try to
" recognize the type of the file and set the 'filetype' option.
" Loading plugin and indent files for specific file types.
filetype plugin indent on

" Not compatible with vi.
set nocompatible

" String-encoding used internally (buffer?).
set encoding=utf-8

" List of dir names for the swap file, seperated with comma.
set directory=$HOME/.vim/swapfiles/

" Command-line completion operates in an enhanced mode.
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" fold setting
set foldmethod=manual
set foldlevel=99
set laststatus=2

" Change the current working dir whenever you open a file, switch buffers,
" delete a buffer or open/close a window.
set autochdir

" Maimum width of text tht is being inserted.
set textwidth=80
" copy indent from the current line when starting a new line.
set autoindent
"replace tab with spaces
set expandtab
" number of spaces to use for each step of (auto)indent.
set shiftwidth=4
" Number of spaces that a <Tab> in the file counts for.
set tabstop=4
" Number of spaces that a <Tab> counts for while performing editing operation.
set softtabstop=4

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" enable fzf.
set runtimepath+=/home/linuxbrew/.linuxbrew/opt/fzf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variables Definition:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "
let maplocalleader=" "



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set indent info for different file types.
autocmd Filetype cpp 
    \ setlocal cindent expandtab cino=g0 shiftwidth=2 tabstop=2 sts=2
autocmd Filetype c 
    \ setlocal cindent expandtab cino=g0 shiftwidth=2 tabstop=2 sts=2

autocmd Filetype sh setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd Filetype tex setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd Filetype matlab setlocal fo+=cj expandtab

" Remember the position when you leave the buffer.
au BufReadPost * 
    \ if line("'\"") > 1 && line("'\"") <= line("$") 
    \ | exe "normal! g'\"" 
    \ | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Defined Commands:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trun off highlighted search matches.
noremap <LEADER><CR> :nohlsearch<CR>

" Window split
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>

" Toggle between multiple window
noremap <LEADER>l <C-w>l
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j

map s <nop>
" Quick save.
map S :w<CR>

" Tab page operations.
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

" fzf
set runtimepath+=/home/linuxbrew/.linuxbrew/bin/fzf



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme: 
syntax enable
set background=dark
if $TERM == "xterm-256color"
    colorscheme iceberg
endif


" Vim Table Mode:
"
" For Markdown-compatible tables use
let g:table_mode_corner='|'
nnoremap <LEADER>tm :TableModeToggle<CR>
nnoremap <LEADER>tdc g:table_mode_delete_column_map<CR>


" NERDTree: 
nnoremap tt :NERDTreeToggle<CR>


" UltiSnips: 
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = 'context'


" CoC Settings:
let g:coc_global_extensions = [
    \   'coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-sh', 'coc-snippets']

