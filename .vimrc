"         _                                  _____      
"  _   __(_)___ ___        _________  ____  / __(_)___ _
" | | / / / __ `__ \______/ ___/ __ \/ __ \/ /_/ / __ `/
" | |/ / / / / / / /_____/ /__/ /_/ / / / / __/ / /_/ / 
" |___/_/_/ /_/ /_/      \___/\____/_/ /_/_/ /_/\__, /  
"                                              /____/   

nnoremap <SPACE> <Nop>
let mapleader=" "


" PLUGINS -----------------------------------------------------------------
" {{{

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'dense-analysis/ale'

Plug 'liuchengxu/vim-which-key'

Plug 'Shougo/deoplete.nvim'

Plug 'roxma/nvim-yarp'

Plug 'roxma/vim-hug-neovim-rpc'

Plug 'Shougo/deoplete-clangx'

Plug 'vim-airline/vim-airline'

Plug 'jiangmiao/auto-pairs'

call plug#end()

let g:deoplete#enable_at_startup = 1

" }}}




" MAPPINGS ----------------------------------------------------------------
" {{{

" Clear hlsearch highlight with C-L
nnoremap <silent> <C-L> :nohlsearch<C-R>='<Bar>diffupdate'<CR><CR><C-L>

" Moving between wrapped lines
nnoremap k gk
nnoremap j gj

" Trigger WhichKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" ALE/LSP mappings
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gi :ALEGoToImplementation<CR>
nnoremap <leader>gt :ALEGoToTypeDefinition<CR>
nnoremap <leader>fr :ALEFindReferences<CR>

" Deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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

" Use ALE as completion sources for all code.
call deoplete#custom#option('sources', {'_': ['ale', 'deoplete-clangx', 'buffer', 'tag',],})

" }}}



" STATUS LINE -------------------------------------------------------------
" {{{



" }}}



" OPTIONS ---------------------------------------------------------
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
set ttimeout ttimeoutlen=100 timeout timeoutlen=100

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

" Signcolumn
set signcolumn=yes

" Vertical line cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Undofile
set undofile

" }}}



" COLORSCHEME ------------------------------------------------------------
" {{{

let g:onedark_terminal_italics=1

set background=dark
if (has("termguicolors"))
    set termguicolors
endif

colorscheme onedark

" }}}
