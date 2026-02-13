-- This is where you enable features that only work
-- if there is a language server active in the file
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	desc = "LSP actions",
-- 	callback = function(event)
-- 		-- local opts = { buffer = event.buf }
-- 		-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
-- 		-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- 		-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
-- 		-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- 		-- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
-- 		-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
-- 		-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
-- 		-- vim.keymap.set("n", "gc", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- 		-- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
-- 		-- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--
--     vim.lsp.document_color.enable(true, event.buf, { style = "virtual" })
-- 	end,
-- })


vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
            [vim.diagnostic.severity.INFO] = " "
        }
    }
})

-- <C-]>        go to definition
-- <C-W>d       vim.diagnostic.open_float()
-- [d           prev diagnostic
-- ]d           next diagnostic
-- gq           format
-- gra          code action
-- grn          rename
-- gO           document symbol
-- <C-s>        signature_help in insert mode
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.

local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Setup language servers.

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

-- Enable each language server by filename under the lsp/ folder
vim.lsp.enable({
  "lua_ls",
  "clangd",
  "pyright",
  "emmet_ls",
  "ts_ls",
  "dartls",
  "tailwindcss",
  "texlab",
})
