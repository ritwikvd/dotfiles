local creategroup = function (...)
    return vim.api.nvim_create_augroup(..., {clear = true})
end

local createcmd = vim.api.nvim_create_autocmd
local home = "/Users/ritwik"

local patternstring = string.gsub("~/.config/**/*,~/.gitconfig,~/.vimrc,~/.clang-format,~/.prettierrc,~/.zshrc,~/.tmux.conf,/usr/local/bin/*", "~", home)
local patternlist = vim.split(patternstring, ",")

createcmd("BufWritePost", {
pattern = patternlist,
group = creategroup("bin_dotfiles_sync"),
command = "silent! !up %:p"
})

createcmd("BufWritePost", {
pattern = "*.tsx,*.ts,*.jsx,*.js",
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

local handle = io.popen("\\ls /opt/homebrew/Cellar/llvm/")
---@diagnostic disable-next-line: need-check-nil
local llvmversion = string.match(handle:read("a"), "[%d%.]*")
---@diagnostic disable-next-line: need-check-nil
handle:close()

createcmd("BufWritePost", {
pattern = "*.c,*.cpp",
group = creategroup("clang-tidy"),
command = "silent! execute \"!/opt/homebrew/Cellar/llvm/" .. llvmversion .. "/bin/clang-tidy % --fix-errors\" | redraw!"
})

createcmd({ "BufEnter", "BufWritePost" }, {
pattern = "*.c,*.cpp",
group = creategroup("clang-format"),
command = "silent! execute \"!/opt/homebrew/Cellar/llvm/" .. llvmversion .. "/bin/clang-format -i --style='file:/Users/ritwik/.clang-format' %\" | redraw!"
})

createcmd({ "BufEnter" }, {
pattern = ".vault,.cards,.ids,.recovery_codes",
group = creategroup("vault"),
command = "setlocal noswapfile nobackup nowritebackup viminfo= clipboard="
})

-- local previewpath = home.."/Desktop/personal/pushowl/dashboard/.github/actions/get-preview"

createcmd("BufWritePost", {
pattern = "**/*/actions/get-preview/index.js",
group = creategroup("get-preview"),
command = "silent! execute \"!npx @vercel/ncc build %:p -o %:p:h/dist\""
})

createcmd({ "BufEnter" }, {
pattern = "**/*/coda/*",
group = creategroup("coda"),
command = "set textwidth=80"
})
