set scrolloff=12
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hls ic is

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

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
nnoremap <leader>4 $
