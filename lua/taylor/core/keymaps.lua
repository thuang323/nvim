vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- some helpful vim keybindings
-- 1. change a word with multiple occurences once in a file
--    :%s/original/new/g
-- 2. change a word with multiple occurences once in the visual line mode
--    :s/old_word/new_word/g


-- general keymaps
keymap.set("i", "jk", "<Esc>")
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")       -- non highlight

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")     -- new tab in vim
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")   -- close tab in vim
keymap.set("n", "<leader>]", "<cmd>tabnext<CR>")     -- go to next tab
keymap.set("n", "<leader>[", "<cmd>tabprevious<CR>") -- go to prev tab

keymap.set("n", "x", '"_x')

keymap.set("n", "<M-a>", "ggVGy<C-o>")                        -- command a and yank
keymap.set({ "i", "c" }, "<M-bs>", "<C-w>", { remap = true }) -- delete a word
keymap.set({ "i", "c" }, "<D-bs>", "<C-u>", { remap = true }) -- delete curr line up to cursor
keymap.set("x", "+", "<C-a>g")                                -- increment line of numbers
keymap.set("x", "-", "<C-x>g")                                -- decrement line of numbers

-- keymap.set({ "n", "x" }, "<C-a>", "ggVGy") -- select all and copy
keymap.set({ "n", "x" }, "<C-d>", "5j") -- scroll down by relative number and center
keymap.set({ "n", "x" }, "<C-u>", "5k") -- scroll down by relative number and center

keymap.set("x", "<C-.>", ">gv")         -- adding indent
keymap.set("x", "<C-,>", "<gv")         -- delete indent

keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

keymap.set({ "n", "x" }, "<leader>cn", "*Ncgn", { remap = true })
keymap.set({ "n", "x" }, "<leader>cN", "*NcgN", { remap = true })

keymap.set("x", "<leader>p", '"_dP')

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope<cr>")
keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>")
-- keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>")
keymap.set("n", "<leader>so", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>sh", "<cmd>Telescope highlights<cr>")

-- comment
keymap.set("n", "<M-/>", "<Plug>(comment_toggle_linewise_current)")
keymap.set("x", "<M-/>", "<Plug>(comment_toggle_linewise_visual)")
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
-- `gcw` - Toggle from the current cursor position to the next word
-- `gc}` - Toggle until the next blank line
-- `gca{` - Toggle around curly brackets
-- `gci{` - Toggle inside curly brackets

-- toggleterm
keymap.set("t", "<M-v>", "<C-\\><C-n>")
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")
keymap.set({ "n", "t" }, "<M-\\>", "<cmd>ToggleTerm<CR>")

-- neo-tree
keymap.set("n", "<leader>eo", "<cmd>Neotree toggle<CR>")
keymap.set("n", "<M-b>", "<cmd>Neotree toggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>Neotree focus<CR>")
keymap.set("n", "<leader>er", "<cmd>Neotree reveal<CR>")

-- trouble
-- Lua
keymap.set("n", "<leader>tf", "<cmd>Trouble<CR>")
keymap.set("n", "<leader>to", "<cmd>TroubleToggle<CR>")
keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
-- keymap.set("n", "<leader>to", function() require("trouble").toggle() end)
-- keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
-- keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
-- keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
-- keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- whichkey
keymap.set("n", "<leader>w", "<cmd>WhichKey<CR>")

-- LazyUI
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- Obsidian
-- keymap.set("n", "<leader>o", "<cmd>ObsidianOpen<CR>")

-- LiveServer
keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>")
keymap.set("n", "<leader>le", "<cmd>LiveServerStop<CR>")

-- Colortils
-- keymap.set("n", "<leader>cp", "<cmd>Colortils picker<CR>")
-- keymap.set("n", "<leader>cl", "<cmd>Colortils css list<CR>")

-- hydra mapping

local Hydra = require("hydra")

Hydra({
  name = "windowsResize",
  mode = "n",
  body = "<C-w>",
  heads = {
    { "+", "<C-w>+" },
    { "-", "<C-w>-" },
    { "<", "<C-w>3<" },
    { ">", "<C-w>3>" },
  },
})
