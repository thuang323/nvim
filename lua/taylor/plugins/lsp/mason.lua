return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- "jayp0521/mason-null-ls.nvim",
	},
	priority = 1000,
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		-- local mason_null = require("mason-null-ls")

		mason.setup()

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
        "vue_ls",
				"emmet_ls",
				"html",
				"cssls",
				"tailwindcss",
				"clangd",
				-- "jdtls",
        "omnisharp",
				"pyright",
				"lua_ls",
				"texlab",
        "docker_compose_language_service",
			},
			-- mason_null.setup({
			-- 	ensure_installed = {
			-- 		"black",
			-- 		"prettier",
			-- 	},
			-- }),
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
