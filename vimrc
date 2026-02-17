call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()

set nocompatible
set hidden
set encoding=utf-8
set mouse=a
set history=1000

colorscheme gruvbox

set clipboard=unnamed

if (has("termguicolors"))
  set termguicolors
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

syntax on
set number
set cursorline
set signcolumn=yes
set noshowmode
set scrolloff=8
set sidescrolloff=8
set splitbelow splitright

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start

set incsearch
set hlsearch
set ignorecase
set smartcase

set lazyredraw
set updatetime=300

let mapleader = " "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <Leader>h :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap n nzzzv
nnoremap N Nzzzv

set statusline=%f\ %m%=%l/%L,%c
set laststatus=2
