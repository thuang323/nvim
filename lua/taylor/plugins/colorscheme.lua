return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000, -- load this plugin first
	config = function()
		require("onedark").setup({
			style = "deep",
			transparent = false,
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "italic",
				strings = "none",
				variables = "none",
			},
			highlights = {

				-- Telescope
				TelescopeNormal = { bg = "#0d0b0b" },
				-- TelescopeBorder = { fg = "", bg = "#0d0b0b" },
				TelescopePromptBorder = { fg = "#0d0b0b", bg = "#101012" },
				TelescopeResultsBorder = { fg = "#0d0b0b", bg = "#101012" },
				TelescopePreviewBorder = { fg = "#0d0b0b", bg = "#101012" },
				TelescopePromptTitle = { fg = "#000000", bg = "#efbd5d" },
				TelescopeResultsTitle = { fg = "#000000", bg = "#db8ad6" },
				TelescopePreviewTitle = { fg = "#000000", bg = "#aae6b2" },

				-- WhichKey
				WhichKeyFloat = { bg = "#0d0b0b" },
			},
		})
		require("onedark").load()
	end,
}
