set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'bling/vim-airline'
Plugin 'lervag/vimtex'
"Plugin 'valloric/youcompleteme'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'PotatoesMaster/i3-vim-syntax'

"let g:vimtex_view_method = 'zathura'



call vundle#end()            " required
filetype plugin indent on    " required




let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel



set t_Co=256
colorscheme gruvbox
syntax enable

set tabstop=4 " visual spaces per tab
set softtabstop=4
set expandtab " actually makes tabs spaces


"" COMMANDS/UI
" show line nums
set number
" show last cmd in bottom bar
set showcmd
" highlight current line
set cursorline
" visual auto complete for cmds
set wildmenu
" highlight matching of brackets
set showmatch

set relativenumber
set incsearch 	" search as characters are entered
set hlsearch 	" highlight matches

set autoindent
set copyindent
set shiftwidth=4

set ignorecase
set smartcase

set nobackup
set noswapfile

set pastetoggle=<F2>

nnoremap ; :
inoremap <esc> <nop>
inoremap jk <esc>
inoremap kj <esc>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


nnoremap <C-n> :NERDTreeToggle<CR>


nnoremap <F3> :w<CR>:!git latexdiff HEAD~0 --no-view -o diff.pdf<CR>
