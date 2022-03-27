set scrolloff=12
set rnu
set number
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

"Autocmd
augroup dotfiles_sync
    au!
    au BufWritePost ~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc :!updotfiles %
augroup end

let mapleader = " "
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
nnoremap <leader>h :copen<CR>
nnoremap <leader>6 <C-^>
nnoremap <leader>4 $
nnoremap <leader>c "+y
vnoremap <leader>c "+y
nnoremap <leader>e :Vex<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
