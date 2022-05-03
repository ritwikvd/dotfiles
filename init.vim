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
set signcolumn=yes

"Settings
let g:netrw_bufsettings='noma nomod nonu nowrap ro nobl nu rnu'
let g:gruvbox_contrast_light='hard'
let g:NERDTreeShowLineNumbers=1
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
Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF
require'lspconfig'.tsserver.setup{
on_attach = function() 
vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0}) 
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) 
vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0}) 
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0}) 
vim.keymap.set("n", "<leader>r", vim.diagnostic.rename, {buffer=0}) 
end}
EOF

colorscheme gruvbox

"Autocmd
augroup bin_dotfiles_sync
    au!
    au BufWritePost ~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc,~/.config/nvim/init.vim,~/.config/starship.toml,~/.tmux.conf silent! !up %:p
    au BufWritePost /usr/local/bin/* silent! !up %:p
augroup end

augroup linting
    au!
    au BufWritePost ~/Desktop/personal/pushowl/dashboard/* silent! execute "!yarn --silent prettier --write --loglevel silent --config ~/.prettierrc %:p" | redraw! 
augroup end

augroup nerdtree
    au!
    au FileType nerdtree setlocal rnu
augroup end

"Remaps
let mapleader = " "
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
nnoremap <leader>o :copen<CR>
nnoremap <leader>a <C-^>
nnoremap <leader>c "+y
nnoremap <leader>e :Vex<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>f gg=G
nnoremap <leader>h _
nnoremap <leader>l $
nnoremap <expr> <C-n> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTreeOpen<CR>' : ':NERDTreeFind<CR>'

vnoremap <leader>c "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

