"Set Options
set autoread
set scrolloff=12
set rnu
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ic is nohls
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
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'windwp/nvim-ts-autotag'
Plug 'rafamadriz/friendly-snippets'
call plug#end()

colorscheme gruvbox

lua << EOF
require'nvim-web-devicons'.setup {
 default = true;
}

local ls = require("luasnip")
ls.filetype_extend("javascript", {"html"})
ls.filetype_extend("typescript", {"html","javascript"})
ls.filetype_extend("javascriptreact", {"html","javascript"})
ls.filetype_extend("typescriptreact", {"html","javascript"})

ls.config.set_config{
history = true,
updateevents = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").load()

require('nvim-ts-autotag').setup()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.eslint.setup{}

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function() 
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) 
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0}) 
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) 
        vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0}) 
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0}) 
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}) 
        vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {buffer=0}) 
    end}

    vim.diagnostic.config({virtual_text = true, signs = true, underline = true, update_in_insert = true, severity_sort = false})

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.opt.completeopt = {"menu", "menuone", "noselect"}

    -- Setup nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-c>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
        })
    })

-- Location information about the last message printed. The format is
-- `(did print, buffer number, line number)`.
local last_echo = { false, -1, -1 }

-- The timer used for displaying a diagnostic in the commandline.
local echo_timer = nil

-- The timer after which to display a diagnostic in the commandline.
local echo_timeout = 250

-- The highlight group to use for warning messages.
local warning_hlgroup = 'WarningMsg'

-- The highlight group to use for error messages.
local error_hlgroup = 'ErrorMsg'

-- If the first diagnostic line has fewer than this many characters, also add
-- the second line to it.
local short_line_limit = 20

-- Shows the current line's diagnostics in a floating window.
function show_line_diagnostics()
  vim
    .lsp
    .diagnostic
    .show_line_diagnostics({ severity_limit = 'Warning' }, vim.fn.bufnr(''))
end

-- Prints the first diagnostic for the current line.
function echo_diagnostic()
  if echo_timer then
    echo_timer:stop()
  end

  echo_timer = vim.defer_fn(
    function()
      local line = vim.fn.line('.') - 1
      local bufnr = vim.api.nvim_win_get_buf(0)

      if last_echo[1] and last_echo[2] == bufnr and last_echo[3] == line then
        return
      end

      local diags = vim
        .lsp
        .diagnostic
        .get_line_diagnostics(bufnf, line, { severity_limit = 'Warning' })

      if #diags == 0 then
        -- If we previously echo'd a message, clear it out by echoing an empty
        -- message.
        if last_echo[1] then
          last_echo = { false, -1, -1 }

          vim.api.nvim_command('echo ""')
        end

        return
      end

      last_echo = { true, bufnr, line }

      local diag = diags[1]
      local width = vim.api.nvim_get_option('columns') - 15
      local lines = vim.split(diag.message, "\n")
      local message = lines[1]
      local trimmed = false

      if #lines > 1 and #message <= short_line_limit then
        message = message .. ' ' .. lines[2]
      end

      if width > 0 and #message >= width then
        message = message:sub(1, width) .. '...'
      end

      local kind = 'warning'
      local hlgroup = warning_hlgroup

      if diag.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
        kind = 'error'
        hlgroup = error_hlgroup
      end

      local chunks = {
        { kind .. ': ', hlgroup },
        { message }
      }

      vim.api.nvim_echo(chunks, false, {})
    end,
    echo_timeout
  )
end
EOF

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

augroup eslint
    au!
    au BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
augroup end

augroup diagnostics
    au!
    autocmd CursorMoved * :lua echo_diagnostic()
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

inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(1)<Cr>
inoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(1)<Cr>
snoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>
