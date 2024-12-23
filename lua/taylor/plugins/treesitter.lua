return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
				disable = {
          "latex",
          "csv",
          "dockerfile",
          "ini",
        },
			},
			indent = { enable = true }, -- enable indentation
			ensure_installed = { -- ensure these language parsers are installed
        "python",
        -- "json",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"lua",
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
