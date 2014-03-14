" let pathogen work first
execute pathogen#infect()

" code folding
set foldmethod=indent
set foldlevel=99

" try to detect filetypes
filetype on
" enable loading indent file for filetype
filetype plugin indent on

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Use F2 to toggle paste
set pastetoggle=<F2>

""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler

" modify the filename completion behavior.
" http://gergap.wordpress.com/2009/07/08/vim-wild-menu/
set wildmode=longest:full
set wildmenu

" change buffer - without saving
set hid

" set backspace config
set backspace=eol,start,indent

" ignore case when searching
set ignorecase
" if typed word has capital letters searching is case sensitive, otherwise not
set smartcase
" Highlight search things
set hlsearch
" Make search act like search in modern browsers
set incsearch
" Don't redraw while executing macros
set lazyredraw
" Set magic on, for regular expressions
set magic

" Show matching bracets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Highlight the current line
set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

set gfn=Monospace\ 10
set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme solarized
  set nonu
else
  set t_Co=16
  set background=dark
  colorscheme solarized
  set nonu
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" highlight trailing white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=%{HasPaste()}%F%m%r%h%w\ \ \ \ Format=%{&ff}\ \ \ \ FileType=%y\ \ \ \ Pos=%l,%v[%p%%]\ \ \ \ %{fugitive#statusline()}

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return '(paste) '
    en
    return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
"let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow=1
" let g:miniBufExplMapCTabSwitchBufs = 1
" miniBufExplMapCTabSwitchBufs = 1 has issue to map C-TAB. An issue of terminal.
" So map S-TAB for cycling through buffer here.
noremap <S-TAB> :MBEbn<CR>
autocmd BufRead,BufNew :call UMiniBufExplorer


""""""""""""""""""""""""""""""
" => NERDTree plugin
""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" => Fugitive plugin
""""""""""""""""""""""""""""""
map <F5> :Gstatus<CR>
map <F6> :Gdiff<CR>
map <F7> :Git log %<CR>


""""""""""""""""""""""""""""""
" => PEP8 plugin
""""""""""""""""""""""""""""""
let g:pep8_map='<F9>'


""""""""""""""""""""""""""""""
" => ack plugin
""""""""""""""""""""""""""""""
map <F4> :Ack! 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loosely following http://www.sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal tw=79
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview


""""""""""""""""""""""""""""""
" => c/c++
"""""""""""""""""""""""""""""""
autocmd FileType c,cpp,h,hpp setlocal tw=79 sw=2 tabstop=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

