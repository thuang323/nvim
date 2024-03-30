vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "<C-c>", "<ESC>")

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>") -- non highlight

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- new tab in vim
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>") -- close tab in vim
keymap.set("n", "<leader>]", "<cmd>tabnext<CR>") -- go to next tab
keymap.set("n", "<leader>[", "<cmd>tabprevious<CR>") -- go to prev tab

keymap.set("n", "x", '"_x')

keymap.set("n", "<M-d>a", "ggVG") -- command a
keymap.set("x", "+", "<C-a>g") -- increment line of numbers
keymap.set("x", "-", "<C-x>g") -- decrement line of numbers

keymap.set({ "n", "x" }, "<C-a>", "ggVGy") -- select all and copy
keymap.set({ "n", "x" }, "<C-d>", "5j") -- scroll down by relative number and center
keymap.set({ "n", "x" }, "<C-u>", "5k") -- scroll down by relative number and center

keymap.set("x", "<C-.>", ">gv") -- adding indent
keymap.set("x", "<C-,>", "<gv") -- delete indent

-- keymap.set("n", "n", "nzzzv") -- center the next search word
-- keymap.set("n", "N", "Nzzzv") -- center the previous search word

keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

keymap.set({ "n", "x" }, "<leader>cn", "*Ncgn", { remap = true })
keymap.set({ "n", "x" }, "<leader>cN", "*NcgN", { remap = true })

keymap.set("x", "<leader>p", '"_dP')

-- toggleterm
keymap.set("t", "<M-v>", "<C-\\><C-n>")

-- neo-tree
keymap.set("n", "<leader>eo", "<cmd>Neotree toggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>Neotree focus<CR>")
keymap.set("n", "<leader>er", "<cmd>Neotree reveal<CR>")

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- whichkey
keymap.set("n", "<leader>w", "<cmd>WhichKey<CR>")

-- LazyUI
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- Obsidian
keymap.set("n", "<leader>o", "<cmd>ObsidianOpen<CR>")

-- LiveServer
keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>")
keymap.set("n", "<leader>le", "<cmd>LiveServerStop<CR>")

-- Colortils
keymap.set("n", "<leader>cp", "<cmd>Colortils picker<CR>")
keymap.set("n", "<leader>cl", "<cmd>Colortils css list<CR>")

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
