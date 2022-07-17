return function ()
    -- LuaSnip
    local ls = require("luasnip")
    ls.filetype_extend("javascript", {"html"})
    ls.filetype_extend("typescript", {"html","javascript"})
    ls.filetype_extend("javascriptreact", {"html","javascript"})
    ls.filetype_extend("typescriptreact", {"html","javascript"})
    ls.config.set_config{ history = true, updateevents = "TextChanged,TextChangedI" }
    require("luasnip.loaders.from_vscode").load()

    -- LSP
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.eslint.setup{}
    lspconfig.cssls.setup({capabilities = capabilities})

    local mappings = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({initial_mode = 'normal'})<cr>", {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references({initial_mode = 'normal'})<cr>", {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "<leader>td", "<cmd>lua require'telescope.builtin'.diagnostics({initial_mode = 'normal'})<cr>", {buffer=0})
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>dw", vim.diagnostic.open_float, {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {buffer=0})
    end

    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = mappings,
        cmd = {"clangd"}
    })

    lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = mappings,
        init_options = {
            plugins = { {name = "typescript-styled-plugin", location = "/opt/homebrew/lib/node_modules/typescript-styled-plugin"} }
        }
    })

    lspconfig.sumneko_lua.setup{
        settings = {
            Lua = {
                runtime = { version = "LuaJIT", path = runtime_path },
                diagnostics = { globals = {"vim"} },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                completion = { callSnippet = "Replace" },
                telemetry = { enable = false },
            },
        },
        capabilities = capabilities,
        on_attach = mappings
    }

    -- CMP
    local cmp = require("cmp")

    require("cmp").setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        window = {--[[  completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()  ]]},
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-c>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({{ name = "nvim_lsp" },{ name = "luasnip" }},{{ name = "buffer"},{ name = "path"}})
    })
end
