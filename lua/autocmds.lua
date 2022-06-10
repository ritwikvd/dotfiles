local creategroup = vim.api.nvim_create_augroup
local createcmd = vim.api.nvim_create_autocmd

local syncgroup = creategroup("bin_dotfiles_sync", {clear = true})

createcmd("BufWritePost", {
pattern = {"*", "~/.config/nvim/**/*", "~/.gitconfig", "~/.vimrc", "~/.prettierrc", "~/.zshrc", "~/.config/starship.toml", "~/.tmux.conf", "/usr/local/bin/*"},
group = syncgroup,
command = "silent! !up %:p"
})

local prettiergroup = creategroup("prettier", {clear = true})

createcmd("BufWritePost", {
pattern = "~/Desktop/personal/pushowl/**/*",
group = prettiergroup,
command = "silent! execute \"!npx --silent prettier --write --loglevel silent --config ~/.prettierrc %:p\" | redraw!"
})

local nerdgroup = creategroup("nerdtreegroup", {clear = true})

createcmd("FileType", {
pattern = "nerdtree",
group = creategroup("nerdtree", {clear = true}),
command = "setlocal rnu"
})

createcmd("BufWritePre", {
pattern = "*.tsx,*.ts,*.jsx,*.js",
group = creategroup("eslint", {clear = true}),
command = "EslintFixAll"
})
