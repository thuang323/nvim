return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			indent = { enable = true }, -- enable indentation
			autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
			ensure_installed = { -- ensure these language parsers are installed
        "python",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"lua",
				"latex",
				"c",
				"cpp",
				"java",
				"markdown",
			},
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}
