vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "<C-c>", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- non highlight

keymap.set("n", "<leader>t", ":tabnew<CR>") -- new tab in vim
keymap.set("n", "<leader>o", ":tabclose<CR>") -- close tab in vim
keymap.set("n", "<leader>]", ":tabnext<CR>") -- go to next tab
keymap.set("n", "<leader>[", ":tabprevious<CR>") -- go to prev tab

keymap.set("n", "x", '"_x')

keymap.set("n", "<M-d>a", "ggVG") -- command a
keymap.set("x", "+", "<C-a>g") -- increment line of numbers
keymap.set("x", "-", "<C-x>g") -- decrement line of numbers

keymap.set("n", "<C-a>", "gg<S-v>G") -- select all
keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down and center
keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up and center
keymap.set("n", "H", "K") -- help
keymap.set({ "n", "x" }, "J", "4j") -- scroll down by relative number and center
keymap.set({ "n", "x" }, "K", "4k") -- scroll down by relative number and center

keymap.set("x", "<C-.>", ">gv") -- adding indent
keymap.set("x", "<C-,>", "<gv") -- delete indent

keymap.set("n", "n", "nzzzv") -- center the next search word
keymap.set("n", "N", "Nzzzv") -- center the previous search word

keymap.set("x", "<leader>p", '"_dP')

-- neo-tree
keymap.set("n", "<leader>er", ":Neotree toggle<CR>")
keymap.set("n", "<leader>ef", ":Neotree reveal<CR>")

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- whichkey
keymap.set("n", "<leader>w", ":WhichKey<CR>")

-- LazyUI
keymap.set("n", "<leader>L", ":Lazy<CR>")

-- LiveServer
keymap.set("n", "<leader>ls", ":LiveServerStart<CR>")
keymap.set("n", "<leader>le", ":LiveServerStop<CR>")

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
