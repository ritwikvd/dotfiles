set scrolloff=12
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hls ic is

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors
let ayucolor="light"
colorscheme ayu

let mapleader = " "
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>i <C-i>
nnoremap <leader>o <C-o>
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>
nnoremap <leader>6 <C-^>
nnoremap <leader>w <C-w>
inoremap <C-q> <Esc>
vnoremap <C-q> <Esc>
cnoremap <C-q> <Esc>
