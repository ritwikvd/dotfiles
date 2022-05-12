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
set termguicolors
set list lcs=tab:\|\ 
set cursorline
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait250-blinkoff200-blinkon200-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

"Settings
let g:netrw_bufsettings='noma nomod nonu nowrap ro nobl nu rnu'
let g:gruvbox_contrast_light='hard'
let g:NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

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
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'preservim/nerdcommenter'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

colorscheme gruvbox
hi CursorLineNr guifg=DarkMagenta

lua << EOF
require'nvim-web-devicons'.setup { default = true; }

require'telescope'.setup{ extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown {} } } }
require("telescope").load_extension("ui-select")

require('telescope').load_extension('fzf')

local ls = require("luasnip")
ls.filetype_extend("javascript", {"html"})
ls.filetype_extend("typescript", {"html","javascript"})
ls.filetype_extend("javascriptreact", {"html","javascript"})
ls.filetype_extend("typescriptreact", {"html","javascript"})

ls.config.set_config{ history = true, updateevents = "TextChanged,TextChangedI" }

require("luasnip.loaders.from_vscode").load()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup{ filetypes: {"css","scss","typescript","javascript"}, settings: {
  css = { validate = true },
  less = { validate = true },
  scss = { validate = true },
  typescript= { validate = true },
  javascript = { validate = true }
}}
require'lspconfig'.eslint.setup{}

local mappings = function() 
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) 
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer=0}) 
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) 
        vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, {buffer=0}) 
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_prev, {buffer=0}) 
        vim.keymap.set("n", "<leader>dw", vim.diagnostic.open_float, {buffer=0}) 
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}) 
        vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {buffer=0}) 
    end

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = mappings}

require'lspconfig'.sumneko_lua.setup{
settings = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
            },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
            },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
            },
        },
    },
    capabilities = capabilities,
    on_attach = mappings}

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
EOF

"Autocmd
augroup bin_dotfiles_sync
    au!
    au BufWritePost ~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc,~/.config/nvim/init.vim,~/.config/starship.toml,~/.tmux.conf silent! !up %:p
    au BufWritePost /usr/local/bin/* silent! !up %:p
augroup end

augroup prettier
    au!
    au BufWritePost ~/Desktop/personal/pushowl/**/* silent! execute "!npx --silent prettier --write --loglevel silent --config ~/.prettierrc %:p" | redraw! 
augroup end

augroup nerdtree
    au!
    au FileType nerdtree setlocal rnu
augroup end

augroup eslint
    au!
    au BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
augroup end

"Remaps
let mapleader = " "
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>p :Telescope git_files<CR>
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
nnoremap <leader>o <cmd>Telescope quickfix<cr>
nnoremap <leader>a <C-^>
nnoremap <leader>c "+y
nnoremap <leader>e :Vex<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader><S-S> :wa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><S-Q> :qa!<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>f gg=G
nnoremap <leader>h _
nnoremap <leader>l $
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader><S-F> <cmd>Telescope live_grep<cr>
nnoremap <leader><S-O> <cmd>lua require'telescope.builtin'.live_grep({grep_open_files=true})<cr>
nnoremap <expr> <C-n> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTreeOpen<CR>' : ':NERDTreeFind<CR>'

xnoremap <leader>c "+y
xnoremap <leader>/ :call nerdcommenter#Comment(1,'toggle')<cr>
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(1)<Cr>
inoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(1)<Cr>
snoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>
