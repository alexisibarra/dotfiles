set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/c.vim'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/perl-support.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tpope/vim-repeat'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'burnettk/vim-angular'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'     " Track the engine.
Plugin 'honza/vim-snippets'   " Snippets 
Plugin 'majutsushi/tagbar'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'mhinz/vim-startify'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'edkolev/promptline.vim'

call vundle#end()             " required
filetype plugin indent on     " required

" non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent    " Indent automatically depending on filetype
set cursorline    " Linea horizontal para el cursor"
set hls           " Higlhight search
set ruler         " Mostrar siempre la linea actual
set scrolloff=3   " Number of lines to keep above and below the cursor.
set sw=2          " sw -> espacios de la indentacion
set wildmenu

" Tabulacion
set expandtab     " Reemplazar tabs con espacios
set smarttab
set tabstop=4
set rnu

" Busqueda
set hls is            " highlight search, incsearch
set ic                " ignore case en las busquedas

set encoding=utf-8
set mouse=a           " Habilitar/Deshabilitar uso de ratón
set showcmd           " Always display an incomplete command in the wildmenu
set textwidth=80
set whichwrap=<,>,[,] " Extiende los movimientos con teclas en modo normal y de inserción

" Autocompleta parentesis, llaves y corchetess
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

" Corrección ortográfica
nmap  :setlocal spell spelllang=es_es<cr>
nmap  :setlocal spell spelllang=en_en<cr>

set history=1000                         " remember more commands and search history
set undolevels=1000

set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                " change the terminal's title
set visualbell                           " don't beep
set noerrorbells                         " don't beep

set nobackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Forbidden to user Arrows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Behaviours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Keymapings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Tabs
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

""" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <

""" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""" Forget highlight of searches
nmap <silent> ,/ :nohlsearch<CR>

""" Save as super user
cmap w!! w !sudo tee % >/dev/null

" Saving and exiting
nmap :W :w
nmap :Wa :wa
nmap :wA :wa
nmap :Wqa :wqa
nmap :Q :q
nmap :WQ :wq

nnoremap ; :

map <C-h> :%s/
map <C-A> GVgg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set t_Co=256 " 256 colors in terminal

set background=dark

if exists('+colorcolumn')
  let &colorcolumn=join(range(80,500),",")
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
else
  " fallback for Vim < v7.3
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Tweaks for Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker', 'perlcritic']
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors = 1

let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \"trimming empty <p>",
    \"*proprietary attribute*",
    \"proprietary attribute \"role\"",
    \"proprietary attribute \"hidden\"",
    \"<html> proprietary attribute \"class\"",
\]

""" CTRLP
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/.git/*,*/tmp/*,*.so,*.swp,*.zip  

""" MatchIt
runtime macros/matchit.vim

""" NERDTree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
let NERDTreeIgnore=['\.o$', '\~$']
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""" Vim-Airline
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

""" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

""" NumberToggle
let g:NumberToggleTrigger="<F3>"

""" Tagbar
nnoremap <F2> :TagbarToggle<CR>

""" Startify
autocmd User Startified set buftype=

""" promptline
"let g:promptline_symbols = {
    "\ 'left'       : '',
    "\ 'left_alt'   : '▶',
    "\ 'dir_sep'    : '/',
    "\ 'truncation' : '...',
    "\ 'vcs_branch' : '',
    "\ 'space'      : ' '}

"let g:promptline_preset = {
        "\'a' : [ promptline#slices#host() ],
        "\'b' : [ promptline#slices#user() ],
        "\'c' : [ promptline#slices#cwd() ],
        "\'y' : [ promptline#slices#vcs_branch() ],
        "\'warn' : [ promptline#slices#last_exit_code() ]}
