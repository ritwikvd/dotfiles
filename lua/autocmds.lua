local creategroup = vim.api.nvim_create_augroup
local createcmd = vim.api.nvim_create_autocmd

createcmd("BufWritePost", {
pattern = {"*", "~/.config/nvim/**/*", "~/.gitconfig", "~/.vimrc", "~/.prettierrc", "~/.zshrc", "~/.config/starship.toml", "~/.tmux.conf", "/usr/local/bin/*"},
group = creategroup("bin_dotfiles_sync", {clear = true}),
command = "silent! !up %:p"
})

createcmd("BufWritePost", {
pattern = "~/Desktop/personal/pushowl/**/*",
group = creategroup("prettier", {clear = true}),
command = "silent! execute \"!npx --silent prettier --write --loglevel silent --config ~/.prettierrc %:p\" | redraw!"
})

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
