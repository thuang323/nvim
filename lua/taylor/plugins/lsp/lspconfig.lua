return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = group,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = group,
        })
      end

      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- set keybinds
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)          -- show definition, references
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)                      -- got to declaration
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)         -- show lsp definitions
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)     -- show lsp implementation
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)    -- show lsp type definitions
      keymap.set("n", "gh", vim.lsp.buf.hover, opts)                            -- show documentation for what is under cursor
      keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
      keymap.set("i", "<M-s>", vim.lsp.buf.signature_help, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)                   -- smart rename
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)     -- see available code actions, in visual mode will apply to selection
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)             -- show diagnostics for line
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)                     -- jump to previous diagnostic in buffer
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)                     -- jump to next diagnostic in buffer
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)                    -- mapping to restart lsp if necessary
      keymap.set({ "n", "v" }, "<M-F>", function()
        vim.lsp.buf.format({ async = true })
      end, opts) -- mapping to format
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tyscript server
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure emmet_ls server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure C/C++ server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure Java server
    lspconfig["jdtls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "standard",
            diagnosticMode = "workspace",
          },
        },
      },
    })

    -- configure LaTeX server
    lspconfig["texlab"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          format = {
            enable = true,
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
              quote_style = "double",
            },
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
