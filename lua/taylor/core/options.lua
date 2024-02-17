local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
-- opt.softtabstop = 2
opt.expandtab = true
-- opt.shiftround = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.scrolloff = 8
opt.sidescrolloff = 10
opt.mousescroll = "ver:1,hor:3"

opt.undofile = true
opt.undodir = ".undodir"
opt.updatetime = 250

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.diagnostic.config({
	virtual_text = false,
})

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end
