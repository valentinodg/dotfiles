" if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
" 	echo "downloading junegunn/vim-plug to manage plugins..."
" 	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
" 	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
" 	autocmd VimEnter * PlugInstall
" endif

call plug#begin()
Plug 'morhetz/gruvbox'
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
Plug 'kien/rainbow_parentheses.vim'
Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'yggdroot/indentline'
" Plug 'tpope/vim-commentary'
" Plug 'franbach/miramare'
" Plug 'jremmen/vim-ripgrep'
" Plug 'majutsushi/tagbar'
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
" Plug 'lervag/vimtex'
call plug#end()

let g:vimtex_view_general_viewer='zathura'
let g:python3_host_prog = '/bin/python3'
let g:coc_global_extensions = ['coc-clangd', 'coc-texlab']

filetype plugin indent on
syntax enable " on
scriptencoding utf-8
let mapleader=" "
let g:mapleader=" "
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

" gruvbox & colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" imap jk <esc>
nmap <F3> /
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
map j gj
map k gk
" nmap <leader><cr> :nohlsearch<cr>
nmap <leader>\ :source %<cr>
" split
map <c-l> :winc l<cr>
map <c-h> :winc h<cr>
map <c-j> :winc j<cr>
map <c-k> :winc k<cr>
map <F11> :VimtexCompile<cr>
" tab
map <leader>tl :tabprevious<cr>
map <leader>th :tabnext<cr>
" move lines
" map <c-j> :m+<cr>==
" map <c-k> :m-2<cr>==
" fast move
map H 0
map L $
" make (req makefile)
map <F10> :make<cr>

au BufNewFile,BufRead zathurarc set syntax=vim
au BufNewFile,BufRead aliasrc set syntax=zsh
au BufNewFile,BufRead *.vertex,*.fragment,*.geometry set syntax=glsl

" disable automatic commenting on newline
"au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" perform dot commands over visual blocks
"vnoremap . :normal .<cr>

":hi CursorLine cterm=none ctermbg=234
":hi CursorLineNr cterm=none ctermbg=234
":hi LineNr ctermbg=233
":hi SignColumn ctermbg=234
":hi StatusLine cterm=none ctermbg=234
":hi Normal ctermbg=232
":hi EndOfBuffer ctermbg=232
"
":hi Pmenu ctermbg=gray ctermfg=black
":hi PmenuSel ctermbg=white ctermfg=black
":hi PmenuSbar ctermbg=gray ctermfg=white
":hi PmenuThumb ctermbg=gray ctermfg=white
":hi Comment ctermfg=101

" ########## PLUGINS ##########

" vifm
map <F2> :Vifm<cr>

" lightline
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
  \ }

" airline
" let g:airline_theme='gruvbox'
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#left_sep=''
" let g:airline#extensions#tabline#left_alt_sep=''
" let g:airline#extensions#tabline#formatter='default'
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep=''
" let g:airline_left_alt_sep=''
" let g:airline_right_sep=''
" let g:airline_right_alt_sep=''
" let g:airline_symbols.branch=''
" let g:airline_symbols.readonly=''
" let g:airline_symbols.linenr=''
" let g:airline_symbols.maxlinenr=''
" let g:airline_symbols.dirty=''

" rainbowparentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

" thenerdcommenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" fzf
" let $FZF_DEFAULT_COMMAND='fd -H'
let $FZF_DEFAULT_COMMAND='rg --ignore-case --files --hidden'
let $FZF_DEFAULT_OPTS='--reverse --inline-info'
map <F5> :Files! ~<cr>
map <F6> :Files! .<cr>
map <F7> :Lines!<cr>
map <F8> :Rg!<cr>

" tabular
map <leader>tt :Tabularize<space>/

" nerdtree
map <F1> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable=' +'
let g:NERDTreeDirArrowCollapsible=' ~'
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" coc.nvim
" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" make <cr> for confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" VSCode like multiple cursors
" function! s:select_current_word()
"   if !get(g:, 'coc_cursors_activated', 0)
"     return "\<Plug>(coc-cursors-word)"
"   endif
"   return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc
" nmap <expr> <silent> <C-d> <SID>select_current_word()

" incsearch incsearch-fuzzy easymotion incsearch-easymotion
" combo function
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
        \ 'converters': [incsearch#config#fuzzy#converter()],
        \ 'modules': [incsearch#config#easymotion#module()],
        \ 'keymap': {"\<CR>": '<Over>(easymotion)'},
        \ 'is_expr': 0,
        \ 'is_stay': 1
      \ }), get(a:, 1, {}))
endfunction
nnoremap <silent><expr> <F4> incsearch#go(<SID>config_easyfuzzymotion())
