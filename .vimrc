set nocompatible

" display
"-----------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set shortmess+=I

set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set display=uhex

set laststatus=2
set cmdheight=2
set showcmd
set title

set scrolloff=2

set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

" search
"-----------------------------------------------------------
set incsearch
set ignorecase
set smartcase

" edit
"-----------------------------------------------------------
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM

" tab
"-----------------------------------------------------------
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
inoremap <C-Tab> <C-V><Tab>


" utf-8
"-----------------------------------------------------------
"let &termencoding=&encoding
"set termencoding=utf-8
"set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932

if &encoding == 'utf-8'
  set ambiwidth=double
endif

" copy to clipboard
if has("unix") && match(system("uname"),'Darwin') != -1 " mac
  " http://www.mail-archive.com/vim-latex-devel@lists.sourceforge.net/msg00773.html
  nnoremap fc :call system("pbcopy", @")<CR>
  nnoremap fp :r! pbpaste<CR>
elseif has('win32unix') " cygwin
  nnoremap fc :call system("putclip", @")<CR>
  nnoremap fp :r! getclip<CR>
endif
