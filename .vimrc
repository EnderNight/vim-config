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

" Clipboard
set clipboard=unnamedplus

" Mouse support
set mouse=a

" Backspace
set backspace=indent,eol,start

" Increasing and decreasing with C-A and C-X
set nrformats+=alpha

" More responsive escape key
set ttimeout ttimeoutlen=100

" Always display status line
set laststatus=2

" Ruler
set ruler

" Display
set display+=lastline

" Delete comment character after joining comments
set formatoptions+=j

" Auto update file
set autoread

" Persist g:UPPERCASE variables
set viminfo^=!

" Problematic legacy behavior
set nolangremap

" Correct spliting
set splitright splitbelow

" }}}



" PLUGINS -----------------------------------------------------------------
" {{{

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

call plug#end()


" }}}



" MAPPINGS ----------------------------------------------------------------
" {{{

" Clear hlsearch highlight with C-L
nnoremap <silent> <C-L> :nohlsearch<C-R>='<Bar>diffupdate'<CR><CR><C-L>



" }}}



" COMMANDS ---------------------------------------------------------------
" {{{

" DiffOrig: display diff between buffer and original file
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis

" Man: enable vim :Man command
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

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
