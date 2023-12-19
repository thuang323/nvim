return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver", -- JavaScript
				"html",
				"cssls",
				"tailwindcss",
				"clangd", -- C or C++
				"jdtls", -- Java
				"pyright", -- python
				-- "r_language_server", -- R
				"lua_ls", -- lua
				"texlab", -- LaTeX
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
