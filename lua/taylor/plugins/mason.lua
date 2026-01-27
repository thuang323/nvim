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
        "lua_ls",
        "clangd",
        "pyright",
        "emmet_ls",
        "ts_ls",
        "tailwindcss",
        "texlab",
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
