"Set Options
set autochdir
set autoread
set scrolloff=12
set rnu
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hls ic is
set termguicolors
set background=light
set background=light

"Settings
let g:netrw_bufsettings = 'noma nomod nonu nowrap ro nobl nu rnu'

"1: blinking block  2: solid block  3: blinking underscore  4: solid underscore  5: blinking vertical bar 6: solid vertical bar
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
let g:gruvbox_contrast_light='hard'

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"Autocmd
autocmd vimenter * ++nested colorscheme gruvbox
augroup dotfiles_sync
    au!
    au BufWritePost ~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc silent! !updotfiles %
    au BufWritePost ~/Desktop/personal/PushOwl/dashboard/* silent! execute "!yarn --silent prettier --write --loglevel silent --config ~/.prettierrc %:p" | redraw! 
augroup end

"Remaps
let mapleader = " "
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
nnoremap <leader>o :copen<CR>
nnoremap <leader>a <C-^>
nnoremap <leader>c "+y
nnoremap <leader>e :Vex<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>

vnoremap <leader>c "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
