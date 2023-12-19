return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 2000

		local which_key = require("which-key")

		which_key.setup({
			window = {
				border = "none", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 0, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			popup_mappings = {
				scroll_down = "<c-j>", -- binding to scroll down inside the popup
				scroll_up = "<c-k>", -- binding to scroll up inside the popup
			},
			layout = {
				height = { min = 4, max = 10 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
			triggers = "false",
			disable = {
				buftypes = {},
				filetypes = {},
			},
		})
	end,
}
