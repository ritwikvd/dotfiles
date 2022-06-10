-- Options
local o = vim.o

-- Global Properties
local g = vim.g

o.autoread = true
o.scrolloff = 12
o.rnu = true; o.nu = true
o.tabstop = 4; o.softtabstop = 4; o.shiftwidth = 4; o.expandtab = true
o.smartindent = true
o.ic = true; o.is = true; o.nohls = true
o.background = "light"
o.signcolumn = "yes"
o.termguicolors = true
o.list = true; o.lcs = "tab:| "
o.cursorline = true
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait250-blinkoff200-blinkon200-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

g.netrw_bufsettings = "noma nomod nonu nowrap ro nobl nu rnu"
g.gruvbox_contrast_list = "hard"
g.NERDTreeShowLineNumbers = 1
g.NERDTreeShowHidden = 1
g.NERDCreateDefaultMappings = 0
g.NERDSpaceDelims = 1
g.NERDCompactSexyComs = 1
g.NERDDefaultAlign = 'left'
g.NERDCommentEmptyLines = 1
g.NERDTrimTrailingWhitespace = 1
g.NERDToggleCheckAllLines = 1
g.nohls = true
