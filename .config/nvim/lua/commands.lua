vim.cmd([[
" hi CursorLineNr guifg=DarkMagenta
hi Cursor guibg=#11f0c3
hi MatchParen guibg=none

xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
]])
