vim.g.mapleader = " "
local set = vim.keymap.set

local function nset(...) set("n", ...) end
local function iset(...) set("i", ...) end
-- local function xset(...) set("x", ...) end
local function sset(...) set("s", ...) end

set({"n", "x"}, "<leader>c", "\"+y", {desc = "Copy Into Clipboard"})

nset("<leader><cr>", "<cmd>so %<cr>", {desc = "Source file"})
nset("<leader>p", "<cmd>Telescope git_files<cr>", {desc = "Open Git Files"})
nset("<leader>P", "<cmd>Telescope find_files<cr>", {desc = "Open All Files"})
nset("<leader>j", "<cmd>cnext", {desc = "Quick Fix Next"})
nset("<leader>k", "<cmd>cprev", {desc = "Quick Fix Previous"})
nset("<leader>o", "<cmd>Telescope quickfix<cr>", {desc = "Open Telescope Quickfix"})
nset("<leader>a", "<c-^>", {desc = "Open Alternate File"})
nset("<leader>e", "<cmd>Vex<cr>", {desc = "Open Vertical Explorer"})
nset("<leader>s", "<cmd>w<cr>", {desc = "Save File"})
nset("<leader>S", "<cmd>wa<cr>", {desc = "Save All Files"})
nset("<leader>q", "<cmd>q<cr>", {desc = "Quit"})
nset("<leader>Q", "<cmd>qa!<cr>", {desc = "Force Quit All"})
nset("<leader>x", "<cmd>xa<cr>", {desc = "Save And Quit All"})
nset("<leader>f", "gg=G<c-o>", {desc = "Format File"})
nset("<leader>h", "_", {desc = "Go To First Non-Space"})
nset("<leader>l", "$", {desc = "Go To End Of Line"})
nset("<leader>b", "<cmd>lua require('telescope.builtin').buffers({initial_mode = 'normal'})<cr>", {desc = "Open Telescope Buffers"})
nset("<leader>F", "<cmd>Telescope live_grep<cr>", {desc = "Telescope Live Grep"})
nset("<leader>O", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files = true})<cr>", {desc = "Telescope Grep Open Files"})
nset("<leader>F", "<cmd>Telescope live_grep<cr>", {desc = "Telescope Live Grep"})
nset("<c-n>", "g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : @% == '' ? ':NERDTreeOpen<cr>' : ':NERDTreeFind<cr>'", {expr = true, desc = "NERDTree Working"})

-- xset("J", "<cmd>m '>+1<cr>gv", {desc = "Move Line Down"})
-- xset("K", "<cmd>m '<-2<cr>gv=gv", {desc = "Move Line Up"})

iset("<c-l>", "<cmd>lua require('luasnip').jump(1)<cr>", {desc = "Next Snippet Location"})
iset("<c-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", {desc = "Previous Snippet Location"})

sset("<c-l>", "<cmd>lua require('luasnip').jump(1)<cr>", {desc = "Next Snippet Location"})
sset("<c-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", {desc = "Previous Snippet Location"})
