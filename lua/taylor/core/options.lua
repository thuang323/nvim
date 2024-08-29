local opt = vim.opt -- for conciseness

vim.g.mapleader = " " -- set local mapleader before loading lazy

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftround = true
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
-- opt.clipboard:append("unnamedplus")

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

if vim.g.neogui then
  vim.g.neogui_opts = {
    window = {
      vsync = true,
      high_dpi = true,
      borderless = true,
      blur = 20,
    },
    margins = {
      top = 0,
      bottom = 5,
      left = 5,
      right = 5,
    },
    multigrid = true,
    mac_opt_is_meta = true,
    cursor_idle_time = 10,
    scroll_speed = 1,

    -- bg_color = 0x282c34,
    bg_color = 0x16181a,
    opacity = 0.92,
    max_fps = 60,
  }
end

opt.guifont = "SF Mono,PingFang TC,Symbols Nerd Font:h15:w14"
