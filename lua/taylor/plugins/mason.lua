return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"emmet_ls",
				"ts_ls",
				"tailwindcss",
				"texlab",
			},
			automatic_installation = true,
		})
	end,
}
