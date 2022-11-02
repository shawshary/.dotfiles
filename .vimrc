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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes



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

" lazygit quick open.
if executable('lazygit')
    autocmd TermOpen * startinsert
    noremap <leader>lg :tabe<CR>:-tabmove<CR>:terminal lazygit<CR> 
endif



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
set runtimepath+=/home/linuxbrew/.linuxbrew/opt/fzf

" pandoc integration
packadd! vim-pandoc

" ale
packadd! ale



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
" For Markdown-compatible grid_tables use
let g:table_mode_corner='+'
"let g:table_mode_separator='|'
let g:table_mode_corner_corner='+'
"let g:table_mode_fillchar='-'
let g:table_mode_header_fillchar='='
"let g:table_mode_delimiter=','

nnoremap <LEADER>tm :TableModeToggle<CR>
nnoremap <LEADER>tdc g:table_mode_delete_column_map<CR>


" NERDTree: 
nnoremap tt :NERDTreeToggle<CR>


" UltiSnips: 
let g:UltiSnipsExpandTrigger = "<c-y>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/user_scripts/UltiSnips"]


" CoC Settings:
let g:coc_global_extensions = [
    \   'coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-sh', 'coc-snippets']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" FZF Settings:
nmap <leader>fz :FZF<CR>


" Vim Pandoc:
"
" Do pandoc convert.
let PANDOC_PREAMBLE = "/home/xinyu/.config/pandoc/preamble.tex"
let PANDOC_ARGS = "--from markdown+grid_tables --toc --filter pandoc-crossref
    \ -V urlcolor=blue --highlight-style kate --number-sections 
    \ -H "..PANDOC_PREAMBLE 

if executable('pandoc-crossref')
    nmap <leader><F5> :execute "Pandoc! pdf" PANDOC_ARGS <CR>
    nmap <F5> :execute "Pandoc pdf" PANDOC_ARGS <CR>
else
    nmap <F5> :Pandoc! pdf --toc <CR>
endif

" Disabled the keyboard mapping.
let g:pandoc#modules#disabled = ["keyboard", "spell"]

" Function used to open the created file.
let g:pandoc#command#custom_open = "MyPandocOpen"


function! MyPandocOpen(file)
    let file = shellescape(fnamemodify(a:file, ':p'))
    let file_extension = fnamemodify(a:file, ':e')
    if file_extension is? 'pdf'
        if !empty($PDFVIEWER)
            return expand('$PDFVIEWER') . ' ' . file
        elseif executable('zathura')
            return 'zathura ' . file
        elseif executable('mupdf')
            return 'mupdf ' . file
        endif
    elseif file_extension is? 'html'
        if !empty($BROWSER)
            return expand('$BROWSER') . ' ' . file
        elseif executable('firefox')
            return 'firefox ' . file
        elseif executable('chromium')
            return 'chromium ' . file
        endif
    elseif file_extension is? 'odt' && executable('okular')
        return 'okular ' . file
    elseif file_extension is? 'epub' && executable('okular')
        return 'okular ' . file
    else
        return 'xdg-open ' . file
    endif
endfunction

" ALE:
" compatible with coc plugin
let g:ale_disable_lsp=1
let g:ale_fixers = {
\   'markdown': ['trim_whitespace', 'remove_trailing_lines']
\}
" Call :ALEFix
nmap <leader>af <Plug>(ale_fix)



" Plugin Helptags:
helptags ALL

