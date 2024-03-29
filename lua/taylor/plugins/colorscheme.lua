return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = false,
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = {},
					functions = { italic = true },
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		-- priority = 1000, -- load this plugin first
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
					-- lsp pop up window
					NormalFloat = { bg = "#101012" },

					-- Telescope
					TelescopeNormal = { bg = "#0d0b0b" },
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
	},
}
