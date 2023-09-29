" DEFAULT OPTIONS ---------------------------------------------------------
" {{{
" Disable vi compatibility
set nocompatible

" File detection, plugin and indent
filetype plugin indent on

" Syntax highlighting
syntax on

" Line numbers
set number relativenumber

" Highlight cursor line
set cursorline

" Tabs
"" tabstop: display length of a tab byte, in space
"" shiftwidth: number of spaces per indent
"" expandtab: tab key only inserts spaces
"" smarttab: when at the beginning of a line, go to the next tabstop
"" softtabstop: simulates tabstop at the current width
set shiftwidth=4 tabstop=4 softtabstop=0 expandtab smarttab

" Backup
set backup backupdir=~/.vim/backup

" Scrolloff
set scrolloff=10

" Search
set incsearch ignorecase smartcase showmatch hlsearch

" Bottom line display
set showcmd showmode

" History
set history=1000

" Wildmenu
set wildmenu wildmode=list:longest,list:full wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Wrapping
set wrap

" }}}



" PLUGINS -----------------------------------------------------------------
" {{{


" }}}



" MAPPINGS ----------------------------------------------------------------
" {{{


" }}}



" VIMSCRIPT ---------------------------------------------------------------
" {{{

" Code folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" }}}



" STATUS LINE -------------------------------------------------------------
" {{{



" }}}
