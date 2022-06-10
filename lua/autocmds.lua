local creategroup = vim.api.nvim_create_augroup
local createcmd = vim.api.nvim_create_autocmd

local syncgroup = creategroup("bin_dotfiles_sync", {clear = true})

createcmd("BufWritePost", {
pattern = {"/Users/ritwik/.config/**/*", "/Users/ritwik/.gitconfig", "/Users/ritwik/.vimrc", "/Users/ritwik/.prettierrc", "/Users/ritwik/.zshrc", "/Users/ritwik/.tmux.conf", "/usr/local/bin/*"},
group = syncgroup,
command = "silent! !up %:p"
})

local prettiergroup = creategroup("prettier", {clear = true})

createcmd("BufWritePost", {
pattern = "/Users/ritwik/Desktop/personal/pushowl/**/*",
group = prettiergroup,
command = "silent! execute \"!npx --silent prettier --write --loglevel silent --config /Users/ritwik/.prettierrc %:p\" | redraw!"
})

local nerdgroup = creategroup("nerdtreegroup", {clear = true})

createcmd("FileType", {
pattern = "nerdtree",
group = nerdgroup,
command = "setlocal rnu"
})

local eslintgroup = creategroup("eslintgroup", {clear = true})

createcmd("BufWritePre", {
pattern = "*.tsx,*.ts,*.jsx,*.js",
group = eslintgroup,
command = "EslintFixAll"
})
