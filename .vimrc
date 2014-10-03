set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/c.vim'
Bundle 'tmhedberg/matchit'
Bundle 'yegappan/mru'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/perl-support.vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'tpope/vim-repeat'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif

set autoindent " Indent automatically depending on filetype
set cursorline " Linea horizontal para el cursor"
set hls " Higlhight search
set relativenumber " set line numbers relative to cursor position
set ruler " Mostrar siempre la linea actual
set scrolloff=3
set sw=2 " sw -> espacios de la indentacion
set wildmenu

" Tabulacion
set tabstop=2
set smarttab

" Busqueda
set ic " ignore case en las busquedas
set hls is " highlight search, incsearch


syntax on " Coloreado

" Reemplazar tabs con espacios
set expandtab

" Remapeo de comandos
nmap :W :w
nmap :Wa :wa
nmap :Wqa :wqa
nmap :Q :q
nmap :WQ :wq

set mouse=a " Habilitar/Deshabilitar uso de ratón
set showcmd "Always display an incomplete command in the lower right of th vim window

"Si el archivo es un texto autorecortar a 80 caracteres por linea
set textwidth=80

"Extiende los movimientos con teclas en modo normal y de inserción
set whichwrap=<,>,[,]


" Autocompleta parentesis, llaves y corchetess
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

inoremap \( (
inoremap \[ [
inoremap \{ {
" Para corrección ortográfica
nmap  :setlocal spell spelllang=es_es<cr>
nmap  :setlocal spell spelllang=en_en<cr>

" Save folds
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
let NERDTreeIgnore=['\.o$', '\~$']

autocmd VimEnter * wincmd w
set encoding=utf-8

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Habilita los plugins
filetype plugin on
let Tlist_Use_Right_Window   = 1
let Tlist_WinWidth = 51
nnoremap <F2> :TlistToggle<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim

nnoremap ; :

set history=1000     " remember more commands and search history
set undolevels=1000

set wildignore=*.swp,*.bak,*.pyc,*.class
set title        " change the terminal's title
set visualbell       " don't beep
set noerrorbells     " don't beep

set nobackup
set noswapfile

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Forbidden to user Arrows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker', 'perlcritic']
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1

" CTRLP
" MatchIt
runtime macros/matchit.vim

