local opt = vim.opt -- for conciseness

vim.g.mapleader = " " -- set local mapleader before loading lazy
vim.g.maplocalleader = " " -- set local mapleader before loading lazy
vim.g.snacks_animate = true

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

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
opt.pumheight = 12

opt.scrolloff = 8
opt.sidescrolloff = 10
opt.mousescroll = "ver:1,hor:3"

opt.undofile = true
opt.updatetime = 250

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.completeopt = "menu,menuone,noinsert,noselect"
opt.pumheight = 10

opt.iskeyword:append("-")

opt.guicursor = "n-v-c-ci-sm:block,i-ve:ver25,r-cr-o:hor20,a:blinkwait100-blinkoff700-blinkon700"
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

if vim.g.neogurt then
  vim.g.neogurt_opts = {
    vsync = true,
    high_dpi = true,
    borderless = true,
    blur = 20,

    margin_top = 0,
    margin_bottom = 5,
    margin_left = 5,
    margin_right = 5,

    macos_option_is_meta = "both",
    cursor_idle_time = 10,
    scroll_speed = 1,

    -- bg_color = get_bg_color(vim.g.colors_name),
    bg_color = 0x16181a, -- cyberdream
    -- bg_color = 0xfaf4ed, -- rose-pine
    -- bg_color = 0xe1e2e7, -- tokyonight day
    -- bg_color = 0x282c34, -- onedark
    opacity = 0.93,
    max_fps = 60,
  }
end

opt.linespace = 0
opt.guifont = "SFMono Nerd Font,PingFang TC,Hack Nerd Font Mono,Symbols Nerd Font:h15:w14"
