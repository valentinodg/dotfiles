call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vifm/vifm.vim'
Plug 'airblade/vim-gitgutter'

" Plug 'yggdroot/indentline'
" Plug 'tpope/vim-commentary'
" Plug 'franbach/miramare'
" Plug 'jremmen/vim-ripgrep'
" Plug 'majutsushi/tagbar'

Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
call plug#end()

let g:vimtex_view_general_viewer='zathura'
let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'
let g:coc_global_extensions = ['coc-clangd', 'coc-texlab']
let mapleader=" "
let g:mapleader=" "

filetype plugin indent on
syntax enable
scriptencoding utf-8

set scrolloff=7
set wildmenu
set history=1000
set autoread
set fileencodings=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd
set number
set showmatch
set nohlsearch
set incsearch
set ignorecase
set smartcase
set backspace=eol,start,indent
set autoindent
set textwidth=500
set formatoptions=tcrqnlmj
set ruler
set background=dark
set mouse=a
set relativenumber
set cmdheight=2
set hidden
set whichwrap+=<,>,h,l
set lazyredraw
set magic
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500
set encoding=utf8
set fileformats=unix,dos,mac
set nobackup
set nowritebackup
set noswapfile
set linebreak
set smartindent
set wrap
set laststatus=2
set modelines=0
set nocompatible
set more
set noautowrite
set wildmode=longest,list:longest,list:full
set sidescrolloff=5
set mousehide
set splitbelow
set splitright
set colorcolumn=0
set noshowmode
set breakindent
set title
set foldenable
set foldmethod=syntax
set foldlevel=99
set nomodeline
set conceallevel=0
set undodir=$HOME/.config/nvim/.undodir
set undofile
set shell=$SHELL
set termguicolors
set clipboard+=unnamed,unnamedplus
set nopaste
set noswapfile
set numberwidth=4
set nolist
set inccommand=nosplit
set complete=.,w,b,u,t,k
set shortmess=atIc
set shiftround
set infercase
set ttyfast
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set t_Co=256
set cursorline
set updatetime=50
set fillchars+=vert:\ 
set showtabline=2
set foldcolumn=1
set path+=**
