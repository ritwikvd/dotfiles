local syncgroup = vim.api.nvim_create_augroup("bin_dotfiles_sync", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
pattern = "~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc,~/.config/nvim/**/*,~/.config/starship.toml,~/.tmux.conf,/usr/local/bin/*",
group = syncgroup,
command = "silent! !up %:p"
})

local prettiergroup = vim.api.nvim_create_augroup("prettier", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
pattern = "~/Desktop/personal/pushowl/**/*",
group = prettiergroup,
command = "silent! execute \"!npx --silent prettier --write --loglevel silent --config ~/.prettierrc %:p\" | redraw!"
})
