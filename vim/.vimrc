set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'lervag/vimtex'
Plugin 'morhetz/gruvbox'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'itchyny/lightline.vim'

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

call vundle#end()            " required
filetype plugin indent on    " required

let g:goyo_width = 110

let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#404040'
let g:limelight_default_coefficient = 0.5

let g:powerline_pycmd="py3"

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

autocmd VimEnter * Goyo
autocmd! User GoyoEnter 
autocmd! User GoyoLeave

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
set bg=dark
syntax enable

set tabstop=4 " visual spaces per tab
set softtabstop=4
set expandtab " actually makes tabs spaces
set laststatus=2


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
"inoremap <esc> <nop>
inoremap jk <esc>
inoremap kj <esc>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

nnoremap <leader>, :!pandoc % -o '%:r'.pdf<cr><cr>

command Q execute "q|q"
command W execute "wq|q"

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <F3> :w<CR>:!git latexdiff HEAD~0 --no-view -o diff.pdf<CR>

au BufNewFile,BufRead,BufReadPost *.qlua set syntax=lua
