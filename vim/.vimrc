set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'bling/vim-airline'
Plugin 'lervag/vimtex'
"Plugin 'tpope/vim-fugitive'
Plugin 'PotatoesMaster/i3-vim-syntax'

"let g:vimtex_view_method = 'zathura'

call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256

colorscheme gruvbox
syntax enable
set tabstop=4
set softtabstop=4
set expandtab	" tabs to spaces
set autoindent
set copyindent
set shiftwidth=4

set ignorecase
set smartcase

set lazyredraw
set nobackup
set noswapfile

set pastetoggle=<F2>

nnoremap ; :

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-n> :NERDTreeToggle<CR>

set number	" line numbers
set relativenumber
"set showcmd	" show last command
"set cursorline	" cursor on current line number
filetype indent on	" indent for different filetypes
set wildmenu
set showmatch 	" highlight parenthesis
set incsearch 	" search as characters are entered
set hlsearch 	" highlight matches


map <F3> :w<CR>:!git latexdiff HEAD~0 --no-view -o diff.pdf<CR>
