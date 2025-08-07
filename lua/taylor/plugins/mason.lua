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
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "vue_ls",
        "emmet_ls",
        "html",
        "cssls",
        "tailwindcss",
        "clangd",
        "omnisharp",
        -- "jdtls",
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
