"Set Options
set autoread
set scrolloff=12
set rnu
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hls ic is
set background=light

"Settings
let g:netrw_bufsettings='noma nomod nonu nowrap ro nobl nu rnu'
let g:gruvbox_contrast_light='hard'
let NERDTreeShowHidden=1

"1: blinking block  2: solid block  3: blinking underscore  4: solid underscore  5: blinking vertical bar 6: solid vertical bar
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

"Autocmd
augroup dotfiles_sync
    au!
    au BufWritePost ~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc,~/.config/nvim/init.vim,~/.config/starship.toml silent! !updotfiles %
    au BufWritePost ~/Desktop/personal/pushowl/dashboard/* silent! execute "!yarn --silent prettier --write --loglevel silent --config ~/.prettierrc %:p" | redraw! 
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
nnoremap <C-n> :NERDTreeToggle<CR>

vnoremap <C-n> :NERDTreeToggle<CR>
vnoremap <leader>c "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-n> :NERDTreeToggle<CR>
