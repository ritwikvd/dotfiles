vim.g.mapleader = " "
local set = vim.keymap.set

local function nset(...) set("n", ...) end
local function iset(...) set("i", ...) end
local function xset(...) set("x", ...) end
local function sset(...) set("s", ...) end
local function tset(...) set("t", ...) end

set({"n", "x"}, "<leader>c", "\"+y", {desc = "Copy Into Clipboard"})

nset("<leader>bl", "<cmd>set background=light<cr>")
nset("<leader>bd", "<cmd>set background=dark<cr>")
nset("<leader><cr>",
    function ()
        local filepath = vim.fn.expand("%:p")
        if string.find(filepath, "nvim/lua/plugins/") then require("packer").sync() end
        vim.cmd("so %")
    end,
    {desc = "Source file"})
nset("<leader>P", "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>", {desc = "Open All Files"})
nset("<leader>H", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {desc = "Open Telescope Help Tags"})
nset("<leader>o", "<cmd>lua require('telescope.builtin').quickfix({initial_mode = 'normal'})<cr>", {desc = "Open Telescope Quickfix"})
nset("<leader>F", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {desc = "Telescope Live Grep"})
nset("<leader>p", "<cmd>lua require('telescope.builtin').git_files()<cr>", {desc = "Open Telescope Buffers"})
nset("<leader>b", "<cmd>lua require('telescope.builtin').buffers({initial_mode = 'normal'})<cr>", {desc = "Open Telescope Buffers"})
nset("<leader>O", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files = true})<cr>", {desc = "Telescope Grep Open Files"})
nset("<leader>j", "<cmd>cnext<cr>", {desc = "Quick Fix Next"})
nset("<leader>k", "<cmd>cprev<cr>", {desc = "Quick Fix Previous"})
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
nset("<c-n>", "g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : @% == '' ? ':NERDTreeOpen<cr>' : ':NERDTreeFind<cr>'", {expr = true, desc = "NERDTree Working"})
nset("<leader>v", "<c-v>", {desc = "Enter Visual Block Mode"})
-- nset(":", "q:i", {desc = "Open Command In Editable Mode"})
-- nset("/", "q/", {desc = "Open Search In Editable Mode"})
-- nset("?", "q?", {desc = "Open Backwards Search In Editable Mode"})

-- xset("J", "<cmd>m '>+1<cr>gv", {desc = "Move Line Down"})
-- xset("K", "<cmd>m '<-2<cr>gv=gv", {desc = "Move Line Up"})
xset("<leader>r", function ()
    vim.cmd("normal \"zy")
    vim.ui.input({prompt = "Enter replacement string: "}, function (input)
        local reg = vim.fn.getreg("z")
        if reg == "" then return end
        vim.cmd("%s/"..reg.."/"..input.."/cg")
        vim.cmd("normal gv")
    end)
end, {desc = "Replace all instances of the highlighted text"})

iset("<c-l>", "<cmd>lua require('luasnip').jump(1)<cr>", {desc = "Next Snippet Location"})
iset("<c-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", {desc = "Previous Snippet Location"})

sset("<c-l>", "<cmd>lua require('luasnip').jump(1)<cr>", {desc = "Next Snippet Location"})
sset("<c-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", {desc = "Previous Snippet Location"})

tset("<esc>", "<c-\\><c-n>", {desc = "Escape In Terminal Mode"})
