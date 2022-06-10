local creategroup = function (...)
    return vim.api.nvim_create_augroup(..., {clear = true})
end

local createcmd = vim.api.nvim_create_autocmd
local home = "/Users/ritwik"

local patternstring = string.gsub("~/.config/**/*,~/.gitconfig,~/.vimrc,~/.prettierrc,~/.zshrc,~/.tmux.conf,/usr/local/bin/*", "~", home)
local patternlist = vim.split(patternstring, ",")

createcmd("BufWritePost", {
pattern = patternlist,
group = creategroup("bin_dotfiles_sync"),
command = "silent! !up %:p"
})

createcmd("BufWritePost", {
pattern = home.."/Desktop/personal/pushowl/**/*",
group = creategroup("prettier"),
command = "silent! execute \"!npx --silent prettier --write --loglevel silent --config ~/.prettierrc %:p\" | redraw!"
})

createcmd("FileType", {
pattern = "nerdtree",
group = creategroup("nerdtree"),
command = "setlocal rnu"
})

createcmd("BufWritePre", {
pattern = "*.tsx,*.ts,*.jsx,*.js",
group = creategroup("eslint"),
command = "EslintFixAll"
})
